class WaitersController < ApplicationController

	def index
		render json: Waiter.all
	end
end
