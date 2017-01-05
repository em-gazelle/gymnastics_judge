module Api
	class SkillsController < ApplicationController
		# def show
		# 	@skill = Skill.find(params[:id])
		# 	render json: skill
		# end

		def index
			render json: Skill.all
		end

		def filter
			skills = Event.where(event_name: params[:selected_event]).first.skills
			render json: skills
		end
	end
end