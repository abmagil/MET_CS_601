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
#

class RoundTable < Table
  #validates :width, :height, absence: true ##TODO Not in 3.2.  Only in 4.
  validates :radius, presence: true

  attr_accessible :radius


end
