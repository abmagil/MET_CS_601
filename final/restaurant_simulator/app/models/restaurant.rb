class Restaurant < ActiveRecord::Base
  attr_accessible :cash_on_hand, :customers_served
end
