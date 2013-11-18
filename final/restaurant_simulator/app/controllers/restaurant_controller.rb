class RestaurantController < ApplicationController
  
  def show
  	@rest = Restaurant.first #for simplicity.  Makes it easy to build out later.
  end
  
end
