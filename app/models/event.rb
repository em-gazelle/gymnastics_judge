class Event < ActiveRecord::Base
	has_many :routines, dependent: :destroy
	has_many :skills, through: :routines

	# has_attached_image :event_pictures
	
	# validates :number_of_skills_per_event_limit
	# def number_of_skills_per_event_limit
	# 	errors.add(:event_name, "does not match skill") unless customer.active?
	# end

	# temporarily...there are no 'deductions'. Everything is performed_perfectly: true

	# Some of the many, many rules for scoring found and taken from the below resources:
	# rules are currently simplified and limited to women's, one level:
	# http://www.nbcolympics.com/news/gymnastics-101-scoring
	# http://www.fig-gymnastics.com/publicdir/rules/files/wag/CoP_WAG_2017-2020_ICI-e.pdf

	def required_elements
	# based on 'element_group'
		case @event_name
		when "Vault"
			nil
		when "Beam"
			{ "A"=> 1, "B"=> 2, "C"=> 3 }
		when "Uneven Bars" 
			{ "A" => 2, "B"=> 3, "C"=> 4 }
		when "Floor" 
			{ "A" => 2, "B"=> 3, "C"=> 3, "D"=> 2 }
		end
	end

	def unmet_requirements
		# return { missing_elements: required_elements } if @skills.empty?
		# return list of all missing skills / requirements to user
		routine_elements = @skills.group(:element_group).count
		@missing_elements = (@event_name == "Vault") || routine_elements.merge(required_elements){|key, routine, required| required - routine}.delete_if {|element, diff_required_v_actual| diff_required_v_actual <= 0}

		if @event_name == "Vault"
			{ missing_two_different_vaults: @skills.count != 2 }.delete_if {|req, missing_req| missing_req == false }
		elsif @event_name == "Floor"
			{ missing_elements: @missing_elements}.delete_if { |req, missing_req| missing_req.empty? }
		else @event_name == "Beam" || "Uneven Bars"
			{ missing_elements: @missing_elements, missing_mount: @skills.find_by(mount: true).blank?, missing_dismount: @skills.find_by(dismount: true).blank? }.delete_if {|missing_req, value| value==false || value.blank?}
		end
	end

	def requirements_met_bonus
		(2.5 if unmet_requirements.empty?) || 0
	end

	def c_score
		# connection values. Some .1, others .2 depending on skills connected
		0
	end

	def neutral_deductions
		# time, attire, podium, out of bounds, ... deductions not attached to any single skill
		0
	end

	def e_score
		# execution score. deductions from each skill summed.
		# e_score = 10.000 - event.deductions.sum("deduction_value")
		10.000
	end

	def d_score
		# difficulty score. top 8 hardest elements (including dismount) summed, save for vault
		# ^^Look up: does the dismount HAVE to be included, even if not in the top 8? ie, 7 top hardest + dismount => bars/beam : @skills.where(dismount: false).order(points: :desc).limit(7).collect(&:points).merge(@skills.where(dismount: true).points).sum
		# "start value"
		# Connection Values included here for bars/beam/floor
		# max bonus of 2.5 points awarded if all requirements are met (element_group x XY)
		
		if @event_name == "Vault"
			(@skills.sum("points") / @skills.count) + requirements_met_bonus
		else
			if @skills.count > 8
				@skills.order(points: :desc).limit(8).collect(&:points).sum + c_score + requirements_met_bonus
			else 
				@skills.sum("points") + c_score + requirements_met_bonus
			end
		end

	end

	def final_score
		@event_name = self.event_name
		@skills = self.skills
		return "-" if @skills.empty?

		(d_score + e_score - neutral_deductions).to_s
	end

	def format_unmet_requirements
		formatted_reqs = []

		unmet_requirements.each do |req|
			if req.include?(true)
				formatted_reqs.push(req[0].to_s.gsub("missing_", '').split("_").map{|r| r.capitalize}.join(" "))
			else
				req[1].map{|r| formatted_reqs.push("#{r[1]} #{r[0]} Skills")}
			end
		end
		formatted_reqs
	end

	def final_info
		{ final_score: final_score, unmet_requirements: format_unmet_requirements, skills: @skills.to_a }
	end
	# Refactor ... 'event' to 'routine' and 'routine' to 'deduction/modification'. put connection_values as new Skill instances (skill_name: connected-skill-to-skill vs. skill, skill + deduction_val) depending on gymnastics-rules (how much volitility in connection value differences? common factors [A to A/element_group or random and more nuanced?])

end
