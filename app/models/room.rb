class Room < ActiveRecord::Base
  attr_accessible  :leibie, :number, :price, :zhuangtai, :people_number, :age, :sex, :name
  validates :leibie, :number, :price, :zhuangtai, :presence => true
  

       
def self.all_with_zhuangtai
     all.map do |room|
     {:id=>room.id, :zhuangtai=>room.zhuangtai}
    end
end
end
