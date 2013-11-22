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
  has_many :tables, inverse_of: :waiter
  
  def onduty?
    return :onduty
  end
end
