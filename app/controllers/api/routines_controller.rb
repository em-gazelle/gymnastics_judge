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

		def destroy
			# binding.pry

			# Event.find(params[:id]).skills.destroy(Skill.find(params[:skill_id]))

			@routine = Routine.find_by(event_id: params[:id], skill_id: params[:skill_id])

			if @routine.destroy
				render json: :no_content
			else
		    	render json: @routine, message: "Failed to remove", status: :bad_request
		    end
		end

		private

		def routine_params
			params.require(:routine).permit(:event_id, :skill_name)
		end
	end
end