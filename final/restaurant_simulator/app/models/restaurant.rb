# == Schema Information
#
# Table name: restaurants
#
#  id               :integer          not null, primary key
#  cash_on_hand     :integer
#  customers_served :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Restaurant < ActiveRecord::Base
  attr_accessible :cash_on_hand, :customers_served
  has_many :tables
end
