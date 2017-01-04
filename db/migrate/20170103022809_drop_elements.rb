class DropElements < ActiveRecord::Migration
  def change
  	drop_table :elements
  end
end
