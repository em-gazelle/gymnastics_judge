module Api
	class EventsController < ApplicationController
		
		def new
			@new_events = ["Beam", "Uneven Bars", "Vault", "Floor"].map{|name| Event.new(event_name: name)}
			render json: @new_events
		end
		# Display 4 events in sidebar for user to choose between. Click => Show pic of event in display box
		# "Add/Create Routine button => api/events/create" => new event, api/events/# /// show list of all @skills
		# User clicks on skill => skillDemo in ReactBox .... user clicks 'add skill to routine' => api/event/#/skills/create @event.skills << @skill => Reactdate list of all skills in routine & score ((api/events/# !!))

		def create
			@event = Event.create(event_params)
			if @event.save
				render json: @event
			else
				render nothing: true, status: :bad_request
			end
		end

		def show
			@skills = @event.skills
			@event.set_final_score

			render json: { event: @event, skills: @skills }
		end

		def index
			render json: Event.all.pluck(:event_name, :id)
			# [["beam", 1], ["floor", 2], [...]] (array of arrays)
			# render json: Event.all
		end

		def destroy
		end

		private

		def event_params
			params.require(:event).permit(:event_name)
		end
	end
end