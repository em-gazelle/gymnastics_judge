require 'rails_helper'

RSpec.describe Api::SkillsController, type: :controller do
	let(:event) { Fabricate(:event, event_name: "Ineffable") }
	let(:ineffable_skills) { Fabricate.times(5, :skill, event_name: "Ineffable") }
	let(:ludicrous_skills) { Fabricate.times(3, :skill, event_name: "Ludicrous") }

	before do
		ineffable_skills
		ludicrous_skills
	end

	describe 'filter' do
		it 'filters skills by event_name' do
			# get :filter, selected_event: event.event_name
			get :filter, event_id: event.id
			expect(response.body).to eq(ineffable_skills.to_json)
		end
	end

end
