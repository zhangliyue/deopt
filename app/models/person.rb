 # encoding:utf-8

class Person < ActiveRecord::Base
  attr_accessible  :address, :age, :name, :sex, :room, :time, :people_zhuangtai
  validates :name, :age, :address, :time, :sex, :presence => true
end
