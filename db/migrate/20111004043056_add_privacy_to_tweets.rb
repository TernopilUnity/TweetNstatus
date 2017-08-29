class AddPrivacyToTweets < ActiveRecord::Migration[4.2]
  def change
    add_column :tweets, :private, :boolean
  end
end
