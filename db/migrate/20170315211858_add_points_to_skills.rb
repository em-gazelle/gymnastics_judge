class AddPointsToSkills < ActiveRecord::Migration
  def change
  	add_column :skills, :points, :string
  end
end
