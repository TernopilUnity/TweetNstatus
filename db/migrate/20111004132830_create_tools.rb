class CreateTools < ActiveRecord::Migration[4.2]
  def change
    create_table :tools do |t|
      t.string :name
      t.integer :counts
      t.boolean :is_broken
      t.date :purchased_on

      t.timestamps
    end
  end
end
