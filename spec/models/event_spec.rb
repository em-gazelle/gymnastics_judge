require 'rails_helper' 

RSpec.describe Event, type: :model do 
	let(:vault_met_reqs) do
		Fabricate(:event, event_name: "Vault") do
			skills { [Fabricate(:skill, event_name: "Vault", points: 1), Fabricate(:skill, event_name: "Vault", points: 4)] }
		end
	end
	let(:floor_met_reqs) do
		Fabricate(:event, event_name: "Floor") do
			skills { [Fabricate.times(2, :skill, event_name: "Floor", element_group: "A", points: 1),
  					  Fabricate.times(3, :skill, event_name: "Floor", element_group: "B", points: 1.5),
					  Fabricate.times(3, :skill, event_name: "Floor", element_group: "C", points: 2),
					  Fabricate.times(2, :skill, event_name: "Floor", element_group: "D", points: 3)].flatten }
		end
	end
	let(:beam_met_reqs) do
		Fabricate(:event, event_name: "Beam") do
			skills { [Fabricate(:skill, event_name: "Beam", dismount: true, element_group: "B", points: 1),
					  Fabricate(:skill, event_name: "Beam", mount: true, element_group: "B", points: 3),
					  Fabricate.times(4, :skill, event_name: "Beam", element_group: "C", points: 2.5),
					  Fabricate(:skill, event_name: "Beam", element_group: "A", points: 1)].flatten }
		end
	end
	let(:drop_vault_reqs) { vault_met_reqs.skills.delete(vault_met_reqs.skills.last) }
	let(:drop_floor_reqs) { floor_met_reqs.skills.delete(floor_met_reqs.skills.where(element_group: "A").first) }
	let(:drop_beam_reqs) { beam_met_reqs.skills.delete(beam_met_reqs.skills.find_by(dismount: true)) }
	let(:event_with_no_skills_added) { Fabricate(:event, event_name: "Uneven Bars") }


	describe 'final_score' do
		context 'when event has at least one assigned skill' do
			context 'when no deductions' do
				
				context 'when requirements are all met' do
					it 'gives bonus and calculates Vault score' do
						expect(vault_met_reqs.final_score).to eq(15.0.to_s)
					end
					it 'gives bonus and calculates Floor score' do
						expect(floor_met_reqs.final_score).to eq(29.0.to_s)
					end
					it 'gives bonus and calculates Beam score' do
						expect(beam_met_reqs.final_score).to eq(27.5.to_s)
					end
				end

				context 'when requirements are not met' do
					it 'gives no bonus and calculates Vault score' do
						drop_vault_reqs
						expect(vault_met_reqs.final_score).to eq(11.0.to_s)
					end
					it 'gives no bonus and calculates Floor score' do
						drop_floor_reqs
						expect(floor_met_reqs.final_score).to eq(26.5.to_s)
					end
					it 'gives no bonus and calculates Beam score' do
						drop_beam_reqs
						expect(beam_met_reqs.final_score).to eq(24.0.to_s)
					end
				end
			end
		end
		context 'event has no skills in routine' do
			it 'returns nil or - ' do
				expect(event_with_no_skills_added.final_score).to eq("-")
			end
		end
	end
end
