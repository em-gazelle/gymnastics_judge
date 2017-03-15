class AddEventNameToSkills < ActiveRecord::Migration
  def change
  	add_column :skills, :event_name, :string
  end
end
