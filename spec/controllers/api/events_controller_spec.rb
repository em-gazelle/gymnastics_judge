require 'rails_helper'

RSpec.describe Api::EventsController, type: :controller do 
	let(:event) { Fabricate(:event, event_name: "Beam") }
	let(:event_params) { Fabricate.attributes_for(:event, event_name: "Beam") }

	let(:vault_met_reqs) do
		Fabricate(:event, event_name: "Vault") do
			skills { [Fabricate(:skill, event_name: "Vault", points: 1), Fabricate(:skill, event_name: "Vault", points: 4)] }
		end
	end
	let(:vault_met_reqs_final_info) do
		{ final_score: "15.0", unmet_requirements: {}, skills: vault_met_reqs.skills }
	end
	let(:event_with_no_skills_final_info) do
		{ final_score: "-", unmet_requirements: { missing_elements: {"A"=> 1, "B"=> 2, "C"=> 3}, missing_mount: true, missing_dismount: true }, skills: [] }
	end

	describe 'new' do
	end

	describe 'create' do
		it 'creates event/routine instance with designated event_name' do
			post :create, event: event_params
			expect(JSON.parse(response.body)['event_name']).to eq(event.event_name)
		end
	end

	describe 'show' do
		context 'event has at least one assigned skill' do
			it 'returns final_score, unmet_requirements hash, and list of associated skills' do
				get :show, id: vault_met_reqs.id

				expect(JSON.parse(response.body)).to eq(JSON.parse(vault_met_reqs_final_info.to_json))
				expect(response.status).to eq(200)
			end
		end
		context 'event has no skills in routine yet' do
			it 'returns 200 and final_score as -, unmet_requirements hash, and no skills' do
				get :show, id: event.id
				expect(JSON.parse(response.body)).to eq(JSON.parse(event_with_no_skills_final_info.to_json))
				expect(response.status).to eq(200)
			end
		end
	end

	describe 'destroy' do
		context 'when event exists' do
			it 'deletes event and all associations' do
				vault_id = vault_met_reqs.id

				delete :destroy, id: vault_met_reqs.id

				expect(Event.find_by(id: vault_id).nil?).to be true
				expect(Routine.where(event_id: vault_id).blank?).to be true
				expect(response.status).to eq(200)
			end
		end
	end
end