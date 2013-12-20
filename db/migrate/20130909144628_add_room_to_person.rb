class AddRoomToPerson < ActiveRecord::Migration
  def change
    add_column :people, :room, :string
  end
end
