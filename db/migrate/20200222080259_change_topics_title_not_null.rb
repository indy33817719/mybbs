class ChangeTopicsTitleNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :topics, :title, false
  end
end
