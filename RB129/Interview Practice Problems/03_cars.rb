# ## CARS SPIKE
# # There is a vehicle company called Cool Car Factory
# # There are 3 trucks and two cars there.
# # A blue garbage truck has orange wheels and picks up garbage
# # An orange recycling truck has blue wheels and picks up recycling
# # A purple car called Do Not Touch Anything Dirty has black wheels and if it touches something dirty says "hey don't touch any dirty stuff!"
# # a green race car that races and has black wheels
# # A red firetruck with black wheels that puts out fires
# # All truck/car's of these types would have these same attributes and you can pass only one argument on instantiation
# # all trucks can carry heavy stuff
# # all cars and the firetruck can go fast
# # all vehicles can drive
# # calling puts on an object of any class should return a sentence describing that object

# =begin
# There is a vehicle company called Cool Car Factory

# There are 3 trucks and two cars there.
# + all vehicles can drive

# - all trucks can carry heavy stuff
# 	- A blue garbage truck has orange wheels and picks up garbage

# 	- An orange recycling truck has blue wheels and picks up recycling

# 	- A red firetruck with black wheels that puts out fires

# - all cars and the firetruck can go fast
# 	- a green race car that races and has black wheels

# 	- A purple car called Do Not Touch Anything Dirty has black wheels and if it touches something dirty says "hey don't touch any dirty stuff!"

# All truck/car's of these types would have these same attributes and you can pass only one argument on instantiation

# calling puts on an object of any class should return a sentence describing that object
# =end

module Fastable
	def go_fast
		"The #{color} #{class_name} that has #{wheels} is going very fast!"
	end
end

class Vehicle
	attr_accessor :color, :wheels, :class_name, :job

	def initialize(color)
		self.color = color
		self.wheels = "black"
	end

	def drive
		"A #{color} #{class_name} has #{wheels} wheels is driving."
	end

	def to_s
		"The #{color} #{class_name} has #{wheels} wheels that #{job}"
	end
end

class Truck < Vehicle
	def initialize(color, wheels, job)
		super(color)
		self.wheels = wheels
		self.job = job
	end

	def carry_heavy_load
		"A #{color} #{class_name} has #{wheels} wheels that can carry heavy stuff!"
	end
end

class GarbageTruck < Truck
	def initialize(color, wheels = "orange", job = "picks up garbage")
		super(color, wheels, job)
		self.class_name = "garbage truck"
	end
end

class RecycleTruck < Truck
	def initialize(color, wheels = "blue", job = "picks up recycling.")
		super(color, wheels, job)
		@class_name = "recycling truck"
	end
end

class FireTruck < Truck
	include Fastable
	
	def initialize(color, wheels = "black", job = "puts out fire")
		super(color, wheels, job)
		self.class_name = "fire truck"
	end
end

class Car < Vehicle
	include Fastable

	def initialize(color, wheels, job)
		super(color)
		self.wheels = wheels
		self.job = job
		self.class_name = "car"
	end
end

class RaceCar < Car
	include Fastable

	def initialize(color, wheels = "black", job = "races")
		super(color, wheels, job)
		self.class_name = "race car"
	end
end

# A purple car called Do Not Touch Anything Dirty has black wheels and if it touches something dirty says "hey don't touch any dirty stuff!"

class SpecialCar < Car
	attr_accessor :touch

	include Fastable

	def initialize(color, wheels = "black", job = "Do not touch any thing dirty")
		super(color, wheels, job)
		self.class_name = "special car"
		self.touch = touch
	end
end


puts garbage_truck = GarbageTruck.new("blue")
puts garbage_truck.carry_heavy_load
puts recycling_truck = RecycleTruck.new("orange")
puts recycling_truck.carry_heavy_load
puts fire_truck = FireTruck.new("red")
puts fire_truck.carry_heavy_load
puts fire_truck.go_fast
puts race_car = RaceCar.new("green")
puts special_car = SpecialCar.new("purple")

