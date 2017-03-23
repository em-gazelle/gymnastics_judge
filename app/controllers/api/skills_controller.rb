module Api
	class SkillsController < ApplicationController
		# before_action :set_event, only: [:filter, :index]

		def index
			@skills = Skill.all
			render json: @skills
			# @skills = Skill.where(event_name: @event.event_name)
			# render json: @event.skills
		end

		def filter
			# @skills = Skill.where(event_name: @event.event_name)
			@skills = Skill.where(event_name: params[:selected_event])
			render json: @skills
		end

		private

		def set_event
			@event = Event.find(params[:event_id])
		end

	end
end