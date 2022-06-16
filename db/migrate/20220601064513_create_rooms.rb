class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name, null:false
      t.text :introduction, null:false
      t.integer :price, null:false
      t.text :address, null:false
      t.string :img
      t.text :comment

      t.timestamps
    end
  end
end
