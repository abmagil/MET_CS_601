class TablesController < ApplicationController
  
  def edit
 @tables = Table.all
  end

  def create
    	@table = Table.new
  end

  def index
  	@tables = Table.all
  end

  def update(party)
  	self.party = party
  	respond_to do |format|
		format.js {}
		format.json { render json: self.name}
		#format.html
	end
  end
  
end
