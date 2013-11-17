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
#  occupied      :boolean
#  type          :string(255)
#  x             :integer
#  y             :integer
#

class Table < ActiveRecord::Base
  
  attr_accessible :capacity, :name, :x, :y, :occupied
  has_one :waiter, inverse_of: :table
  has_one :party
  belongs_to :restaurant


end
