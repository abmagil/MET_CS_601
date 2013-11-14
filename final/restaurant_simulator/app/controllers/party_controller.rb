class PartyController < ApplicationController
  belongs_to :table
  
	def create
		@party = Party.new

		respond_to do |format|
			format.js {}
			format.json { render json: @party.title}
			#format.html
		end
	end

	def new
		@party = Party.new

		respond_to do |format|
		  format.js {}
			format.json { render json: @party.id}
			#format.html
		end
	end
	
	def index
	 	@parties = Parties.all
	end

end
