# == Schema Information
#
# Table name: waiters
#
#  id         :integer          not null, primary key
#  onduty     :boolean
#  good       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#

class Waiter < ActiveRecord::Base
  attr_accessible :name, :onduty, :good
  has_many :table, inverse_of: :waiter
end
