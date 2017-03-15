require 'rails_helper'

RSpec.describe Api::EventsController, type: :controller do 
	let(:event) { Fabricate(:event, event_name: "Beam") }
	let(:event_params) { Fabricate.attributes_for(:event, event_name: "Beam") }

	describe 'new' do
	end

	describe 'create' do
		it 'creates event/routine instance with designated event_name' do
			post :create, event: event_params
			expect(JSON.parse(response.body)['event_name']).to eq(event.event_name)
		end
	end

	describe 'show' do
		
	end

end