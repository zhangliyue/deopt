class AddNumToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :num, :integer, :default => 0
  end
end
