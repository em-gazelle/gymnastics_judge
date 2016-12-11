class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :final_score
      t.string :max_score
      t.boolean :gender

      t.timestamps null: false
    end
  end
end
