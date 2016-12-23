module Api
	class GymnasticsController < ApplicationController
		def index
			render json: Gymnastic.all
		end
	end
end