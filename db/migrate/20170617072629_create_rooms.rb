class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name, null: false, unique: true
      t.boolean :is_connected, null: false, default: false

      t.timestamps
    end
  end
end
