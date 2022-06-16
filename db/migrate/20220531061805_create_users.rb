class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :user_img
      t.text :self_introduction
      t.string :password_digest

      t.timestamps
    end
  end
end
