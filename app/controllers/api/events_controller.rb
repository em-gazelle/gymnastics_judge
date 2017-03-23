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
			@event = Event.find(params[:id])
			render json: @event.final_info
		end

		def index
			@events = Event.all
			# @events = Event.all.pluck(:event_name, :id, :final_score)
			# [["beam", 1], ["floor", 2], [...]] (array of arrays)
			render json: @events
		end

		def destroy
			@event = Event.find(params[:id])

		    if @event.destroy
		    	render json: :no_content
		    else
		    	render json: @event, message: "Failed to remove", status: :bad_request
		    end
		end

		private

		def event_params
			params.require(:event).permit(:event_name)
		end
	end
end