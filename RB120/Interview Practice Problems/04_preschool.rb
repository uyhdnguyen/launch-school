## PRESCHOOL SPIKE
# Inside a preschool there are children, teachers, class assistants, a principal, janitors, and cafeteria workers.
# Both teachers and assistants can help a student with schoolwork and watch them on the playground.
# A teacher teaches and an assistant helps kids with any bathroom emergencies. Kids themselves can learn and play.
# A teacher and principal can supervise a class.
# Only the principal has the ability to expel a kid.
# Janitors have the ability to clean.
# Cafeteria workers have the ability to serve food.
# Children, teachers, class assistants, principals, janitors and cafeteria workers all have the ability to eat lunch.

=begin
Nouns
- Children
- Teacher
- ClassAssistants
- Principal
- Janitors
- CafeteriaWorkers

Verbs
- help (schoolwork)
- watch
- teach
- help (bathroom emergencies)
- learn
- play
- supervise (class)
- expel (student)
- clean
- serve (food)
- eat (lunch)

Organization
------------
- Children
	- learn
	- play
	- eat lunch
- Teacher
	- help (schoolwork)
	- watch (playground)
	- teach
	- supervise (class)
	- eat lunch
- ClassAssistants
	- help (schoolwork)
	- watch (playground)
	- help (bathroom emergencies)
	- eat lunch
- Principal
	- expel (student)
	- supervise (class)
	- eat lunch
- Janitors
	- clean
	- eat lunch
- CafeteriaWorkers
	- serve (food)
	- eat lunch
=end
module Supervise
	def supervise
	end
end

module Helpable
	def help_schoolwork
	end
end

module Watchable
	def watch_playground
	end
end

class PreschoolMembers
	def eat_lunch
	end
end

class Children < PreschoolMembers
	def learn
	end
	
	def play
	end
end

class Janitors < PreschoolMembers
	def clean
	end
end

class CafeteriaWorkers < PreschoolMembers
	def serve_food
	end
end

class Principlal < PreschoolMembers
	include Supervise
	
	def expel
	end
end

class Teacher < PreschoolMembers
	include Supervise
	include Helpable
	include Watchable

	def teach
	end
end

class ClassAssistants < PreschoolMembers
	include Watchable
	include Helpable

	def help_bathroom
	end
end