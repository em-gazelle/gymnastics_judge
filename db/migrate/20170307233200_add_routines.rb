class AddRoutines < ActiveRecord::Migration
  def change
  	create_table :routines do |t|
		t.references :event, index: true, foreign_key: true
		t.references :skill, index: true, foreign_key: true
  	end
  	remove_column :skills, :event_id, :references
  end
end
