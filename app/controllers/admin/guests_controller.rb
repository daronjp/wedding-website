class Admin::GuestsController < ApplicationController
  
  before_filter :admin_only
  
  def new
    @guest = Guest.new
    
    Galileo.create(:controller => 'admin_guest',
                     :view => 'new',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
  end
  
  def create
    @guest = Guest.new(params[:guest])
      
    if @guest.save
      
      Galileo.create(:controller => 'admin_guest',
                     :view => 'create',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
      
      redirect_to admin_guests_path, :notice => "Guest Created!"
    else
      render "new"
    end
  end
  
  def index
    @guest = Guest.all
    
    Galileo.create(:controller => 'admin_guest',
                     :view => 'index',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
  end
  
  def show
    @guest = Guest.find(params[:id])
    
    Galileo.create(:controller => 'admin_guest',
                     :view => 'show',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
    
  end
  
  def edit
    @guest = Guest.find(params[:id])
    
    Galileo.create(:controller => 'admin_guest',
                     :view => 'edit',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
  end
  
  def update
    @guest = Guest.find(params[:id])
    
    if @guest.update_attributes(params[:guest])
      
      Galileo.create(:controller => 'admin_guest',
                     :view => 'update',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
      
      redirect_to admin_guest_path(@guest)
    else
      render 'edit'
    end
  end
  
end
