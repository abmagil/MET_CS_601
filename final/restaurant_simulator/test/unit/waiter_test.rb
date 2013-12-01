# == Schema Information
#
# Table name: waiters
#
#  id           :integer          not null, primary key
#  onduty       :boolean
#  good         :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  name         :string(255)
#  bank_account :float            default(100.0)
#

require 'test_helper'

class WaiterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
