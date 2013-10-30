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
  TABLE_FOR_TWO = "%rect{:height=>'100', :style=>'#00ff00, stroke-width: 1, stroke:#000000', :width => '100'}"
  TABLE_FOR_FOUR = "%circle{:fill=>'#393', :cx=>'300',:cy=>'300', :r=>'50'}"
  
  attr_accessible :capacity, :name
  has_one :waiter, inverse_of: :table
  belongs_to :restaurant
end
