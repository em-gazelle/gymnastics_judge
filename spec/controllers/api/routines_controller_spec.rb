require 'rails_helper'

RSpec.describe Api::RoutinesController, type: :controller do
	let(:mythical_event) { Fabricate(:event, event_name: "Vault") }
	let(:mythical_skill) { Fabricate(:skill, event_name: "mythical_event", skill_name: "Mythical") }

	describe 'create' do
		it 'adds skill into event routine' do
			post :create, routine: { event_id: mythical_event.id, skill_name: mythical_skill.skill_name }
			expect(response.status).to eq(200)
			expect(JSON.parse(response.body)).to eq([JSON.parse(mythical_skill.to_json)])
		end
	end

end