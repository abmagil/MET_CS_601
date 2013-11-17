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
#

require 'test_helper'

class RectTableTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
