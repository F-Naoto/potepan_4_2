class ChangeAccommodationIdToRoomId < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :accommodation_id, :room_id
  end
end
