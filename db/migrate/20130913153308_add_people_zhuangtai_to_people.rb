class AddPeopleZhuangtaiToPeople < ActiveRecord::Migration
  def change
    add_column :people, :people_zhuangtai, :string
  end
end
