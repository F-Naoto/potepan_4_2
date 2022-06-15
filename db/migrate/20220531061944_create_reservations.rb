class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :from_when
      t.date :to_when
      t.integer :stay_number
      t.references :user, null: false, foreign_key: true
      t.references :accommodation, null: false, foreign_key: true
      t.timestamps
    end
  end
end
