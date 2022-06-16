class RemoveColumnTotalFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :total_price, :integer
    remove_column :reservations, :total_day, :integer
  end
end
