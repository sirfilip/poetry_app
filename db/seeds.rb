# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Tag.destroy_all

["love", "life", "flowers", "clouds", "winter", "snow", "summer", "vacation", "sea", "wind", "sufring"].each do |t|
  Tag.create(:name => t)
end  
