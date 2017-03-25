module Api
	class RoutinesController < ApplicationController

		def create
			@event = Event.find(routine_params[:event_id])
			@skill = Skill.find(routine_params[:skill_id])

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
			params.require(:routine).permit(:skill_id, :event_id)
		end
	end
end