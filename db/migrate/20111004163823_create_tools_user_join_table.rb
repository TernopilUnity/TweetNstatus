class CreateToolsUserJoinTable < ActiveRecord::Migration[4.2]
  def change
    # we need to disable the primary key with `id: false` on this table,
    # it doesn't represent a model but serves as a join table to the
    # has_and_belongs_to_many relationship between tools and users.
    create_table :tools_users, id: false do |t|
      t.integer :Tool_id
      t.integer :User_id
    end
  end
end
