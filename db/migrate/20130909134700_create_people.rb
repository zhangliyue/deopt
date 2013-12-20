class CreatePeople < ActiveRecord::Migration
    create_table :people do |t|
      t.string :age
      t.string :name
      t.string :sex
      t.string :address
      t.string :room

      t.timestamps
    end
  end
