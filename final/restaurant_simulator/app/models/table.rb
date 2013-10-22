class Table < ActiveRecord::Base
  attr_accessible :capacity, :name
  has_one :waiter
  belongs_to :restaurant
end
