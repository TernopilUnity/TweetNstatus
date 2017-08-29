class RemoveLocationFromTweets < ActiveRecord::Migration[4.2]
  def up
    remove_column :tweets, :location
  end

  def down
    add_column :tweets, :location, :string
  end
end
