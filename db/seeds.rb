require('pry-byebug')
require_relative("../models/student")
require_relative("../models/house")

house1 = House.new({"name" => "Gryffindor"})
house2 = House.new({"name" => "Slytherin"})
house3 = House.new({"name" => "Ravenclaw"})
house4 = House.new({"name" => "Hufflepuff"})

house1.save
house2.save
house3.save
house4.save

student1 = Student.new({"first_name" => "Harry", "second_name" => "Potter", "house_id" => house1.id, "age" => 13})
student2 = Student.new({"first_name" => "Ron", "second_name" => "Weasley", "house_id" => house1.id, "age" => 13})
student3 = Student.new({"first_name" => "Draco", "second_name" => "Malfoy", "house_id" => house2.id, "age" => 13})

student1.save
student2.save
student3.save

binding.pry

nil

