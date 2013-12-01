# == Schema Information
#
# Table name: restaurants
#
#  id               :integer          not null, primary key
#  cash_on_hand     :float
#  customers_served :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Restaurant < ActiveRecord::Base
  attr_accessible :cash_on_hand, :customers_served
  has_many :tables

  def bus_table meal_price
  	self[cash_on_hand] ||= 0
  	self[cash_on_hand] += meal_price
  	add_customer
  	self
  end

  def add_customer
  	self[customers_served] ||= 0
  	self[customers_served] += 1
  	self
  end


end
