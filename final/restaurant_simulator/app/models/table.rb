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
#  drawString    :string(255)
#

class Table < ActiveRecord::Base
  TABLE_FOR_TWO = "%%rect{:height=>'100', :width => '100', :style=>'$white, stroke-width: 1, stroke:#000000', :x => %d, :y => %d}"
  TABLE_FOR_FOUR = "%%circle{:fill=>'$white', :r=>'50', :cx => %d, :cy => %d}"
  
  attr_accessible :capacity, :name
  has_one :waiter, inverse_of: :table
  has_one :party
  belongs_to :restaurant
end
