class ChangeEventGender < ActiveRecord::Migration
  def change
  	change_column :events, :gender, :string
  end
end
