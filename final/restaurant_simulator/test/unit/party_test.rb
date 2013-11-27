# == Schema Information
#
# Table name: parties
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  table_id   :integer
#  seated     :boolean
#  done       :boolean
#

require 'test_helper'

class PartyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
