# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

Array(0..4).each do |num|
  Mood.create({:mood => num + 1*20, :created_at => (Time.now - 7.days) + num.days, :updated_at => Time.now - num.days})
  Weight.create({:weight => 200 -(num * 25), :created_at => (Time.now - 6.days) + num.days, :updated_at => Time.now - num.days})
end
