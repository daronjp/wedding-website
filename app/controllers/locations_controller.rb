class LocationsController < ApplicationController
  
  def index
    @outdoors = Location.where(:category => 'Outdoors').order(:neighborhood)
    @dinner = Location.where(:category => 'Dinner').order(:neighborhood)
    @dessert = Location.where(:category => 'Dessert').order(:neighborhood)
    @lunch = Location.where(:category => 'Lunch').order(:neighborhood)
    @breakfast = Location.where(:category => 'Breakfast').order(:neighborhood)
    @coffee = Location.where(:category => 'Coffee').order(:neighborhood)
    @drinks = Location.where(:category => 'Bar').order(:neighborhood)
    @entertainment = Location.where(:category => 'Entertainment').order(:neighborhood)
  end
  
end
