# == Schema Information
#
# Table name: tables
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  capacity      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  name          :string(255)      not null
#

class Table < ActiveRecord::Base
  attr_accessible :capacity, :name
  has_one :waiter, inverse_of: :table
  belongs_to :restaurant
end
