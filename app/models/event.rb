class Event < ActiveRecord::Base
	has_many :routines
	has_many :skills, through: :routines

	# NO - model methods for now.... can expand in future if other sports added. has_many :requirements
	# NO - has_many :skills, through: :requirements
	# has_attached_image :event_pictures
	
	# delegate/scope based on event_name ... then use within model methods
	# model methods used for calculating E/D/etc. score should take 'event_name' as a param

end