class Routine < ActiveRecord::Base
	# has_many :skills, through: :judgeable
	# belongs_to :user
	belongs_to :event
	belongs_to :skill

	# validates :event_name_matches_skill_name
	# delegate :event_name, to: :skill
end