# The following is a short description of an application that lets a customer place an order for a meal:

# - A meal always has three meal items: a burger, a side, and drink.
# - For each meal item, the customer must choose an option.
# - The application must compute the total cost of the order.

# 1. Identify the nouns and verbs we need in order to model our classes and methods.
# 2. Create an outline in code (a spike) of the structure of this application.
# 3. Place methods in the appropriate classes to correspond with various verbs.

=begin
Nouns:
- meal
- order
- burger
- side
- drink
- customer
Verbs:
- compute (total)
- choose
- place (order)

Organization:
-------------
- Customer (name, order)
	- place (order)
- Meal (burger, side, drink)
	- add (meal to order)
- Order (order)
	- total
- OrderManagement (customer)
	- serve
=end
require 'pry'

class Customer
	BURGER = {1 => ["Fish Burger",5.5], 2 => ["Chicken Burger", 6.5], 3 => ["Beef Burger", 7.5]}

	SIDE = {1 => "Tomato", 2 => "Onion", 3 => "Pickles"}

	DRINK = {1 => "Soda", 2 => "Iced Tea", 3 => "Water"}

	attr_accessor :name, :order

	def initialize
		self.name = set_name
		self.order = []
	end

	def set_name
		answer = nil
		
		loop do
			puts "What's your name?"
			answer = gets.chomp.capitalize
			break unless answer.empty?
			puts "Please enter your name."
		end

		answer
	end

	def place_order
		burger_choice = nil
		side_choice = nil
		drink_choice = nil

		loop do
			puts "What would you like to get today?"
			puts "Please choose 1, 2 or 3"
			puts "1. Fish Burger"
			puts "2. Chicken Burger"
			puts "3. Beef Burger"
			burger_choice = gets.chomp.to_i
			break if (1..3).include? burger_choice
		
			puts "Sorry, invalid choice."
		end

		loop do
			puts "What side would you like to include?"
			puts "Please choose 1, 2,or 3"
			puts "1. Tomato"
			puts "2. Onion"
			puts "3. Pickles"
			side_choice = gets.chomp.to_i
			break if (1..3).include? side_choice
		
			puts "Sorry, invalid choice."
		end

		loop do
			puts "What drink would you like to include?"
			puts "Please choose 1, 2,or 3"
			puts "1. Soda"
			puts "2. Iced Tea"
			puts "3. Water"
			drink_choice = gets.chomp.to_i
			break if (1..3).include? drink_choice
		
			puts "Sorry, invalid choice."
		end

		self.order << Meal.new(burger_choice, SIDE[side_choice], DRINK[drink_choice])
	end
end

class Meal
	attr_accessor :burger, :side, :drink, :cost

	def initialize(burger, side, drink)
		self.burger = burger
		self.cost = Customer::BURGER[burger].last
		self.side = side
		self.drink = drink
	end
end

class OrderManagement
	attr_accessor :customer, :system_order

	def initialize
		self.customer = Customer.new
		self.system_order = customer.order
	end

	def display_total
		total_cost = system_order.reduce(0) do |total, meal|
			total += meal.cost
		end
		puts " Your total would be: $#{total_cost}"
	end

	def serve
		order_again_answer = nil
		loop do
			customer.place_order
			puts "Would you llke to add more to the order?"
			order_again_answer = gets.chomp.downcase
			break unless order_again_answer == 'y'
		end
		display_total
	end
end

fast_food_restaurant = OrderManagement.new
fast_food_restaurant.serve

# class Customer
#   def place_order
#     @order = Order.new
#   end
# end

# class Order
#   def initialize
#     @burger = Burger.new
#     @side = Side.new
#     @drink = Drink.new
#   end

#   def meal
#     [@burger, @side, @drink]
#   end

#   def to_s
#     meal.map(&:to_s).join(", ")
#   end

#   def total
#     @burger.cost + @side.cost + @drink.cost
#   end
# end

# class MealItem
#   def initialize
#     @option = choose_option
#   end

#   def choose_option
#     puts "Please choose a #{self.class} option:"
#     item_options

#     gets.chomp
#   end

#   def item_options
#     self.class::OPTIONS.each do |opt, val|
#       puts "#{opt}. #{val[:name]} : $#{val[:cost]}"
#     end
#   end

#   def to_s
#     self.class::OPTIONS[@option][:name]
#   end

#   def cost
#     self.class::OPTIONS[@option][:cost]
#   end
# end

# class Burger < MealItem
#   OPTIONS = {
#     '1' => { name: 'LS Burger', cost: 3.00 },
#     '2' => { name: 'LS Cheeseburger', cost: 3.50 },
#     '3' => { name: 'LS Chicken Burger', cost: 4.50 },
#     '4' => { name: 'LS Double Deluxe Burger', cost: 6.00 }
#   }
# end

# class Side < MealItem
#   OPTIONS = {
#     '1' => { name: 'Fries', cost: 0.99 },
#     '2' => { name: 'Onion Rings', cost: 1.50 }
#   }
# end

# class Drink < MealItem
#   OPTIONS = {
#     '1' => { name: 'Cola', cost: 1.50 },
#     '2' => { name: 'Lemonade', cost: 1.50 },
#     '3' => { name: 'Vanilla Shake', cost: 2.00 },
#     '4' => { name: 'Chocolate Shake', cost: 2.00 },
#     '5' => { name: 'Strawberry Shake', cost: 2.00 }
#   }
# end

# joe = Customer.new
# puts joe.place_order.total
