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
  t = r.tables.create!(capacity: 2, name: t, x: t * 200, y: 120, type: "RoundTable")
  t.radius= 55
  t.save!
end

range = 5..9
range.each do |t| #Next five tables hold 4 people each
  t = r.tables.create!(capacity: 4, name: t, x: (t -4) *150 + 20, y: 280, type: "RectTable")
  t.height= 70
  t.width= 125
  t.save!
end

Waiter.create(name: "Aaron", good: false, onduty: false)
Waiter.create(name: "Becky", good: true, onduty: false)
Waiter.create(name: "Charles", good: false, onduty: false)
Waiter.create(name: "Diana", good: true, onduty: false)
Waiter.create(name: "Elaine", good: true, onduty: false)
Waiter.create(name: "Frances", good: true, onduty: false)
Waiter.create(name: "Geno", good: false, onduty: false)
Waiter.create(name: "Haleigh", good: true, onduty: false)
Waiter.create(name: "Isaac", good: false, onduty: false)