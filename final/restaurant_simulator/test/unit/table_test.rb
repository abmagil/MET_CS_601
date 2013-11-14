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

require 'test_helper'

class TableTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
