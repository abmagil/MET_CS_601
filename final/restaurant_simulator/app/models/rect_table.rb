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
#  width         :integer
#  height        :integer
#  radius        :integer
#  waiter_id     :integer
#  party_id      :integer
#

class RectTable < Table
  validates :width, :height, presence: true
  #validates :radius, absence: true ##TODO Not in 3.2, only in 4+

  attr_accessible :width, :height

end
