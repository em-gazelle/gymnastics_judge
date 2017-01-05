module Api
	class EventsController < ApplicationController
		
		def create
			event = Event.new(event_params)
			if event.save
				render json: event
			else
				render nothing: true, status: :bad_request
			end
		end

		def index
			render json: Event.all.pluck(:event_name, :id)
			# [["beam", 1], ["floor", 2], [...]] (array of arrays)
			# render json: Event.all
		end

		def search
			query = params[:query]
			events = Event.where(event_name: query)
			render json: events
		end

		private

		def event_params
			params.require(:event).permit(:event_name, :gender)
		end
	end
end