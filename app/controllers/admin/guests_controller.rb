class Admin::GuestsController < ApplicationController
  
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
  end
  
end
