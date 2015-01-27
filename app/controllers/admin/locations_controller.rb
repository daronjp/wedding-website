class Admin::LocationsController < ApplicationController
  
  def index
    @location = Location.all
    
    Galileo.create(:controller => 'admin_location',
                     :view => 'index',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
  end
  
  def create
    @location = Location.new(params[:location])
      
    if @location.save
      
      Galileo.create(:controller => 'admin_location',
                     :view => 'create',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
      
      redirect_to admin_locations_path, :notice => "Location Created!"
    else
      render "new"
    end
  end
  
  def edit
    @location = Location.find(params[:id])
    
    Galileo.create(:controller => 'admin_location',
                     :view => 'edit',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
  end
  
  def new
    @location = Location.new
    
    Galileo.create(:controller => 'admin_location',
                     :view => 'new',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
  end
  
  
  def update
    @location = Location.find(params[:id])
    
    if @location.update_attributes(params[:location])
      
      Galileo.create(:controller => 'admin_location',
                     :view => 'update',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
      
      redirect_to admin_locations_path
    else
      render 'edit'
    end
  end
  
  
end
