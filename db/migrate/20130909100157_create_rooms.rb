class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :leibie
      t.string :number
      t.string :zhuangtai
      t.string :price
      t.integer:people_number, :default => 0
      t.string :name
      t.string :age
      t.string :sex

      t.timestamps
    end
  end
end
