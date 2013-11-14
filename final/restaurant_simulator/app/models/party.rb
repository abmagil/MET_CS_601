# == Schema Information
#
# Table name: parties
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Party < ActiveRecord::Base
  attr_accessible :title, :body
end
