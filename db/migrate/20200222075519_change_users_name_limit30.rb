class ChangeUsersNameLimit30 < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :name, :string, limit: 30
  end

  def down
    change_column :users, :name, :string
  end
end
