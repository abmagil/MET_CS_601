class PartyController < ApplicationController
	def create
	#	@party = Party.new
	end

	def new
	#	@party = Party.new
	end
	
	def index
	  @parties = Parties.all
	end

end
