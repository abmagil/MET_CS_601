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

require 'test_helper'

class TableTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
