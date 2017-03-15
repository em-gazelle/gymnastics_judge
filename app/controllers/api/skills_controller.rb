module Api
	class SkillsController < ApplicationController
		before_action :set_event, only: [:create]

		def index
			# @skills = Skill.where(event_name: @event.event_name)
			# render json: @skills
			render json: Skill.all
		end

		def filter
			@skills = Skill.where(event_name: params[:selected_event])
			render json: @skills
		end

		private

		def set_event
			@event = Event.find(params[:event_id])
		end

	end
end