class AddColumnToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :total_price, :integer
  end
end
