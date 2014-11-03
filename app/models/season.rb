class Season < ActiveRecord::Base
  include ActiveModel::Validations

  validates_presence_of :name, :end_date, :start_date
  validates :start_date, start_date: true, if: Proc.new { |s| s.start_date && s.end_date } 
end
