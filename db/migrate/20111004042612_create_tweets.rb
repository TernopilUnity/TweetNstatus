class CreateTweets < ActiveRecord::Migration[4.2]
def change
    create_table :tweets do |t|
      t.string :message
      t.integer :User_id

      t.timestamps
    end
  end
end
