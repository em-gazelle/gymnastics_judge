class Event < ActiveRecord::Base
	has_many :elements

	# has_many :requirements
	# has_many :skills, through: :requirements
	# has_attached_image :event_pictures
	
end
