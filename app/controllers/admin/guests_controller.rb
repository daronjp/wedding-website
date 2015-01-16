class Admin::GuestsController < ApplicationController
  
  before_filter :admin_only
  
  def new
    @guest = Guest.new
  end
  
  def create
    @guest = Guest.new(params[:guest])
      
    if @guest.save
      redirect_to admin_guests_path, :notice => "Guest Created!"
    else
      render "new"
    end
  end
  
  def index
    @guest = Guest.all
  end
  
  def show
    @guest = Guest.find(params[:id])
  end
  
  def edit
    @guest = Guest.find(params[:id])
  end
  
  def update
    @guest = Guest.find(params[:id])
    
    if @guest.update_attributes(params[:guest])
      redirect_to admin_guest_path(@guest)
    else
      render 'edit'
    end
  end
  
end
