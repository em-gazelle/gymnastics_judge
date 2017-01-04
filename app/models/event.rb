class Event < ActiveRecord::Base
	has_many :skills

	# has_many :requirements
	# has_many :skills, through: :requirements
	# has_attached_image :event_pictures
	
end