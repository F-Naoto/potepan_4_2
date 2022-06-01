class RemoveCommentFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :comment, :text
  end
end
