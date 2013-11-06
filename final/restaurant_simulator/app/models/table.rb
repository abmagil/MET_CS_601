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
  TABLE_FOR_TWO = "%%rect{:height=>'100', :width => '100', :style=>'#00ff00, stroke-width: 1, stroke:#000000', :x => %d, :y => %d}"
  TABLE_FOR_FOUR = "%circle{:fill=>'#393', :r=>'50'}"
  
  attr_accessible :capacity, :name
  has_one :waiter, inverse_of: :table
  belongs_to :restaurant
end
