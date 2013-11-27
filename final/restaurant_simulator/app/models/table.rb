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

class Table < ActiveRecord::Base
  
  attr_accessible :capacity, :name, :x, :y, :occupied, :type #TODO Only added type because it was causing a hangup in the seeds.rb file.  MUST remove for security pruposes eventually.
  belongs_to :waiter
  has_one :party
  belongs_to :restaurant

  validates :capacity, :numericality => {:only_integer => true}
  validates :x, :y, :presence => true


end
