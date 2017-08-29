class AddLocationIdToTweets < ActiveRecord::Migration[4.2]
  def up
    add_column :tweets, :location_id, :integer
    add_index :tweets, :location_id
  end

  def down
    remove_index :tweets, :location_id
    remove_column :tweets, :location_id
  end
end
