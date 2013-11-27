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

class Party < ActiveRecord::Base
	belongs_to :table
	
	attr_accessible :title, :body, :table
end
