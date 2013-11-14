class PartyController < ApplicationController
  
	def create
		@party = Party.new

		respond_to do |format|
			format.js {}
			format.json { render json: @party.table.name}
			#format.html
		end
	end

	def new
		@party = Party.new
		respond_to do |format|
			format.html { render :partial => 'new' }
			format.js {}
		end
	end
	
	def index
	 	@parties = Parties.all
	end



end
