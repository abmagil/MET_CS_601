class PartyController < ApplicationController
  
	def create
		@party = Party.create
		respond_to do |format|
			format.html { render :partial => 'new', :object => @party, :value => @party.id}
			format.js {}
		end
	end
	
	def index
	 	@parties = Party.all
	end
end
