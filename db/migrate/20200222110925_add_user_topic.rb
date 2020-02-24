class AddUserTopic < ActiveRecord::Migration[5.2]
  def change
    add_reference :topics, :user, index: true
  end
end
