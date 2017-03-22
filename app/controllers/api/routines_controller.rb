module Api
	class RoutinesController < ApplicationController

		def create
			@event = Event.find(params[:event_id])
			@skill = Skill.find_by(skill_name: routine_params[:skill_name])

			if @event.skills << @skill
				render json: @event.skills
			else
				render json: "Couldn't add skill to routine"
			end
		end

		def destroy
			@routine = Routine.find_by(event_id: params[:event_id], skill_id: params[:id])

			if @routine.destroy
				render json: :no_content
			else
		    	render json: @routine, message: "Failed to remove", status: :bad_request
		    end
		end

		private

		def routine_params
			params.require(:skill).permit(:skill_name)
		end
	end
end