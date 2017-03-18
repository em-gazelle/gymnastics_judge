require 'rails_helper'

RSpec.describe Api::EventsController, type: :controller do 
	let(:event) { Fabricate(:event, event_name: "Beam") }
	let(:event_params) { Fabricate.attributes_for(:event, event_name: "Beam") }

	let(:scored_event) { Fabricate(:event, event_name: "Vault") }
	let(:empty_event) { Fabricate(:event, event_name: "Uneven Bars") }

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
			it 'calculates final_score attribute based on all skills assigned to event' do
			end
		end
		context 'event has no skills in routine yet' do
		end
	end

end