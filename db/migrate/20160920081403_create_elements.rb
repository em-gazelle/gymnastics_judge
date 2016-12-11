class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.string :element_name
      t.string :max_value
      t.string :final_value
      t.string :connection_value
      t.boolean :connected_to_prior_element
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
