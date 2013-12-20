class Timesheet < ActiveRecord::Base
  scope :scope, lambda{where(:status=>"open")}


end
