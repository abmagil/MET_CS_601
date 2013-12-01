class WaitersController < ApplicationController

	def index
		render json: Waiter.all
	end

	def update
		@waiter = Waiter.find_by_name(params["waiter"])
	end
end
