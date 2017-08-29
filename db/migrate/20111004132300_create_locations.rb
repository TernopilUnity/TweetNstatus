class CreateLocations < ActiveRecord::Migration[4.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :tweeter_id

      t.timestamps
    end
  end
end