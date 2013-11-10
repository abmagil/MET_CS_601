class PartiesController < ApplicationController

	def create
		@party = Party.new
	end

	def new
		@party = Party.new
	end

end
