class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :skill_name
      t.string :element_group
      t.boolean :acro_series
      t.boolean :mount
      t.boolean :dismount
      t.string :link
      t.references :event, index: true, foreign_key: true
    end
  end
end
