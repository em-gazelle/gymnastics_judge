require 'rails_helper'

RSpec.describe Api::RoutinesController, type: :controller do
	let(:vault_event) { Fabricate(:event, event_name: "Vault") }
	let(:vault_s) { Skill.find_by(skill_name: "Yurchenko") }

	describe 'create' do
		it 'adds skill into event routine' do
			post :create, routine: { event_id: vault_event.id, skill_name: vault_s.skill_name }
			expect(response.status).to eq(200)
			expect(JSON.parse(response.body)).to eq([JSON.parse(vault_s.to_json)])
		end
	end

end