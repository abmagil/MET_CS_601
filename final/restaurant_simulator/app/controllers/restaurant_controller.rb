class RestaurantController < ApplicationController
  
  def show
  	@tables = Table.all
  end
  
end
