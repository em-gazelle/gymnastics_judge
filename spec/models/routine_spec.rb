require 'rails_helper' 

RSpec.describe Routine, type: :model do 

	describe 'validate event_name' do
		it 'ensures event_name on Skill matches event_name on Event' do
		end
	end
	describe 'validate_event_specific_rules' do
		it 'does not allow more than one assigned skill when event_name is Vault' do
		end
		it 'does not allow more than one mount or dismount when event_name is Bars or Beam' do
		end
	end
end
