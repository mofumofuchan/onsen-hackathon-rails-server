class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :username
      t.integer :room_id
      t.string :message
      t.boolean :perfume

      t.timestamps
    end
  end
end
