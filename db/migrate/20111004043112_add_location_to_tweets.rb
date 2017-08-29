class AddLocationToTweets < ActiveRecord::Migration[4.2]
  def change
    change_table :tweets do |t|
      t.string :location, :limit => 30
      t.boolean :show_location, :default => false
      t.string :category_name
    end
  end
end
