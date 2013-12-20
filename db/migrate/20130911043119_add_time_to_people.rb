class AddTimeToPeople < ActiveRecord::Migration
  def change
    add_column :people, :time, :string
  end
end
