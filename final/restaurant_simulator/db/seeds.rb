# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
r = Restaurant.create(cash_on_hand: 180000, customers_served: 0)

range = 1..4
range.each do |t|  #First four tables seat 2 people each
  Table.create(restaurant_id: r, capacity: 2)
end