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
  
end
