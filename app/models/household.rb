class Household < ActiveRecord::Base
  
  attr_accessible :household_name, :seats, :zip, :id
  has_many :guests
  belongs_to :guest
  
end
