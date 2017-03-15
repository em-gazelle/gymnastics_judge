class ChangeStringsToDecimals < ActiveRecord::Migration
  def change
  	change_column :skills, :points, 'decimal USING points::numeric(5,3)'
  	change_column :events, :max_score, 'decimal USING max_score::numeric(5,3)'
	change_column :events, :final_score, 'decimal USING final_score::numeric(5,3)'
  	# change_column :events, :final_score, :decimal, precision: 5, scale: 3
  end
end
