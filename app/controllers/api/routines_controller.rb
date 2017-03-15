module Api
	class RoutinesController < ApplicationController

		def create
			@event = Event.find(routine_params[:event_id])
			@skill = Skill.find_by(skill_name: routine_params[:skill_name])

			if @event.skills << @skill
				render json: @event.skills
			else
				render json: "Couldn't add skill to routine"
			end
		end


		private

		def routine_params
			params.require(:routine).permit(:event_id, :skill_name)
		end
	end
end