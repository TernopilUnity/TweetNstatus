class RemoveCategoryNameFromTweets < ActiveRecord::Migration[4.2]
  def up
    remove_column :tweets, :category_name
  end

  def down
    add_column :tweets, :category_name, :string
  end
end
