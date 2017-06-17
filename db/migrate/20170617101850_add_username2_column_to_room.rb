class AddUsername2ColumnToRoom < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :username2, :string
  end
end
