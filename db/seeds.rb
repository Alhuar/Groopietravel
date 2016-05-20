# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


=begin
Concert.create([
	{name: 'Thrice', date: "2016-02-11 14:40:18 +0200", place_name: 'Caracol', place_location: 'Madrid'},
	{name: 'Bonobo', date: "2016-03-15 14:40:18 +0200", place_name: 'Sala Barcelona', place_location: 'Barna'},
	{name: 'Bonobo', date: "2016-04-01 14:40:18 +0200", place_name: 'Staples Center', place_location: 'New York'},
	{name: 'Bonobo', date: "2016-05-15 14:40:18 +0200", place_name: 'Jazz Arena', place_location: 'Utah'},
	{name: 'Bon Iver', date: "2016-04-05 14:40:18 +0200", place_name: 'Razzmatazz', place_location: 'Barna'},
	{name: 'Bon Iver', date: "2016-04-06 14:40:18 +0200", place_name: 'Sala Barna', place_location: 'Sevilla'},
	{name: 'Bon Iver', date: "2016-04-06 14:40:18 +0200", place_name: 'Sala Jaen', place_location: 'Jaen'},
	{name: 'Bon Iver', date: "2016-04-07 14:40:18 +0200", place_name: 'Sala París', place_location: 'Paris'},
	{name: 'Bon Iver', date: "2016-04-08 14:40:18 +0200", place_name: 'Sala Dublín', place_location: 'Dublin'},
	{name: 'Bon Iver', date: "2016-04-09 14:40:18 +0200", place_name: 'Sala Cardiff', place_location: 'Cardiff'},
	{name: 'Bon Iver', date: "2016-04-10 14:40:18 +0200", place_name: 'Sala Winsconsin', place_location: 'Winsconsin'},
	{name: 'Bon Iver', date: "2016-04-11 14:40:18 +0200", place_name: 'Boston', place_location: 'Boston'},
	{name: 'Bon Iver', date: "2016-04-12 14:40:18 +0200", place_name: 'Marco Aldany', place_location: 'Madrid'},
	{name: 'Thrice', date: "2016-05-17 14:40:18 +0200", place_name: 'Razzmatazz', place_location: 'Barna'},
	{name: 'Thrice', date: "2016-05-18 14:40:18 +0200", place_name: 'Sala la London', place_location: 'London'},
	{name: 'Thrice', date: "2016-05-19 14:40:18 +0200", place_name: 'Mécanique Ondulatoire', place_location: 'Paris'},
	{name: 'Thrice', date: "2016-05-20 14:40:18 +0200", place_name: 'Kartoffen platz', place_location: 'Berlin'},
	{name: 'Thrice', date: "2016-05-21 14:40:18 +0200", place_name: 'Some Cool Place', place_location: 'California'}
	])

=end


# Band.create([
# 	#{name: 'El Páramo', image: "some image", description: "Best trash band ever"},
# 	{name: 'Thrice', image: "some image", description: "They are back"},
# 	#{name: 'Bonobo', image: "some image", description: "Good trip hop"},
# 	{name: 'Bon Iver', image: "some image", description: "Eclectic"}
# 	])	
User.create([
	{name: "sito", email: "sito@sito.com", password: "123456"},
	{name: "alfon", email: "alfon@alfon.com", password: "123456"},
	{name: "pepe", email: "pepe@pepe.com", password: "123456"}
	])
	
# # Band.first.concerts.create([
# # 	{name: 'El Páramo', date: "2016-11-07 14:40:18 +0200", place_name: 'Riviera', place_location: 'Madrid'},
# # 	{name: 'El Páramo', date: "2016-11-08 14:40:18 +0200", place_name: 'Razzmatazz', place_location: 'Barna'},
# # 	{name: 'El Páramo', date: "2016-11-09 14:40:18 +0200", place_name: 'Sala Winsconsin', place_location: 'Winsconsin'},
# # 	{name: 'El Páramo', date: "2016-11-20 14:40:18 +0200", place_name: 'Sala Cardiff', place_location: 'Cardiff'},
# # 	{name: 'El Páramo', date: "2016-11-22 14:40:18 +0200", place_name: 'Sala Zaragoza', place_location: 'Zaragoza'},
# # 	{name: 'El Páramo', date: "2016-11-26 14:40:18 +0200", place_name: 'Sala Santander', place_location: 'Santander'}
# # 	])

# Band.second.concerts.create([
# 	{name: 'Thrice', date: "2016-02-11 14:40:18 +0200", place_name: 'Caracol', place_location: 'Madrid'},
# 	{name: 'Thrice', date: "2016-05-17 14:40:18 +0200", place_name: 'Razzmatazz', place_location: 'Barna'},
# 	{name: 'Thrice', date: "2016-05-18 14:40:18 +0200", place_name: 'Sala la London', place_location: 'London'},
# 	{name: 'Thrice', date: "2016-05-19 14:40:18 +0200", place_name: 'Mécanique Ondulatoire', place_location: 'Paris'},
# 	{name: 'Thrice', date: "2016-05-20 14:40:18 +0200", place_name: 'Kartoffen platz', place_location: 'Berlin'},
# 	{name: 'Thrice', date: "2016-05-21 14:40:18 +0200", place_name: 'Some Cool Place', place_location: 'California'}	
# 	])

# Band.third.concerts.create([
# 	{name: 'Bonobo', date: "2016-03-15 14:40:18 +0200", place_name: 'Sala Barcelona', place_location: 'Barna'},
# 	{name: 'Bonobo', date: "2016-04-01 14:40:18 +0200", place_name: 'Staples Center', place_location: 'New York'},
# 	{name: 'Bonobo', date: "2016-05-15 14:40:18 +0200", place_name: 'Jazz Arena', place_location: 'Utah'}
# 	])

# Band.fourth.concerts.create([
# 	{name: 'Bon Iver', date: "2016-04-05 14:40:18 +0200", place_name: 'Razzmatazz', place_location: 'Barna'},
# 	{name: 'Bon Iver', date: "2016-04-06 14:40:18 +0200", place_name: 'Sala Barna', place_location: 'Sevilla'},
# 	{name: 'Bon Iver', date: "2016-04-06 14:40:18 +0200", place_name: 'Sala Jaen', place_location: 'Jaen'},
# 	{name: 'Bon Iver', date: "2016-04-07 14:40:18 +0200", place_name: 'Sala París', place_location: 'Paris'},
# 	{name: 'Bon Iver', date: "2016-04-08 14:40:18 +0200", place_name: 'Sala Dublín', place_location: 'Dublin'},
# 	{name: 'Bon Iver', date: "2016-04-09 14:40:18 +0200", place_name: 'Sala Cardiff', place_location: 'Cardiff'},
# 	{name: 'Bon Iver', date: "2016-04-10 14:40:18 +0200", place_name: 'Sala Winsconsin', place_location: 'Winsconsin'},
# 	{name: 'Bon Iver', date: "2016-04-11 14:40:18 +0200", place_name: 'Bonston', place_location: 'Boston'},
# 	{name: 'Bon Iver', date: "2016-04-12 14:40:18 +0200", place_name: 'Marco Aldany', place_location: 'Madrid'}
# 	])


puts "Seeds created madafakar"