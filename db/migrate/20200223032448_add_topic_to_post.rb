class AddTopicToPost < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts,:topic
  end
end
