class AddRestTimeToPeople < ActiveRecord::Migration
  def change
    add_column :people, :rest_time, :string
  end
end
