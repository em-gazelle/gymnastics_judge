require 'rails_helper'

RSpec.describe Api::RoutinesController, type: :controller do
	let(:mythical_event) { Fabricate(:event, event_name: "Vault") }
	let(:mythical_skill) { Fabricate(:skill, event_name: "mythical_event", skill_name: "Mythical") }
	let(:mystical_event) do
		Fabricate(:event, event_name: "Mystical") do
			skills { Fabricate.times(13, :skill, event_name: "Mystical", points: 33) }
		end
	end
	let(:mystical_skill_id) { mystical_event.skills.last.id }
	
	describe 'create' do
		it 'adds skill into event routine' do
			post :create, event_id: mythical_event.id, skill: { skill_name: mythical_skill.skill_name }
			expect(response.status).to eq(200)
			expect(JSON.parse(response.body)).to eq([JSON.parse(mythical_skill.to_json)])
		end
	end

	describe 'destroy' do
		context 'when skill is properly associated with event and params [event_id, skill_id] are present' do
			it 'does not delete skill but removes from Event/Routine join table' do
				delete :destroy, event_id: mystical_event.id, id: mystical_skill_id

				expect(Skill.find(mystical_skill_id).nil?).to be false
				expect(Routine.find_by(event_id: mystical_event.id, skill_id: mystical_skill_id).nil?).to be true
			end
			it 'removes skill from event/routine, leaves other associated skills intact' do				
				expect{
					delete :destroy, event_id: mystical_event.id, id: mystical_skill_id
				}.to change(mystical_event.skills, :count).by(-1)
			end
		end
	end

end