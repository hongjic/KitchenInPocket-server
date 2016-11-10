class CreateTableRecipes < ActiveRecord::Migration
  def up
    create_table :recipes do |t|
      t.string :name, limit: 15, null: false
      t.integer :user_id, null: false
      t.integer :create_time, limit: 8, null: false
    end

    add_foreign_key :recipes, :users, column: :user_id
  end

  def down
    drop_table :users
  end

end