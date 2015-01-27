class LocationsController < ApplicationController
  
  def index
    @outdoors = Location.where(:category => 'Outdoors').order(:description)
    @dinner = Location.where(:category => 'Dinner').order(:description)
    @dessert = Location.where(:category => 'Dessert').order(:description)
    @lunch = Location.where(:category => 'Lunch').order(:description)
    @breakfast = Location.where(:category => 'Breakfast').order(:description)
    @coffee = Location.where(:category => 'Coffee').order(:description)
    @drinks = Location.where(:category => 'Bar').order(:description)
    @entertainment = Location.where(:category => 'Entertainment').order(:description)
    
    Galileo.create(:controller => 'locations',
                     :view => 'index',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
  end
  
end
