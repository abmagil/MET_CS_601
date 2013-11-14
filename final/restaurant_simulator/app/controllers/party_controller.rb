class PartyController < ApplicationController
	def create
		@party = Party.new

		respond_to do |format|
			format.json { render json: @party.title}
			#format.html
		end
	end

	def new
		@party = Party.new

		respond_to do |format|
			format.json { render json: @party.title}
			#format.html
		end
	end
	
	def index
	 	@parties = Parties.all
	end

end
