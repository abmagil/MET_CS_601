# == Schema Information
#
# Table name: parties
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Party < ActiveRecord::Base
	belongs_to :table
	
	attr_accessible :title, :body, :table

	def initialize
		
	end

	def update(table)
		
	end

end
