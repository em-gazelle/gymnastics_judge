class Routine < ActiveRecord::Base
	# belongs_to :user
	belongs_to :event
	belongs_to :skill

	# validates :event_name_matches_skill_name
	# validates :event_rules (one mount/dismount for beam/bars, one skill only for vault)
	# delegate :event_name, to: :skill
end
