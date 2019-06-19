class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :phone_number, null: false, unique: true
      t.string :password_digest, null: false
      t.string :avatar

      t.timestamps
    end
  end
end
