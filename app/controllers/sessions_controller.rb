class SessionsController < ApplicationController
  
  skip_before_filter :gate_keeper
  
  def new
  end
  
  def create
    guest = Guest.authenticate(params[:email], params[:password])
    if guest
      session[:guest_id] = guest.id
      redirect_to root_path
    else
      flash[:notice] = "Invalid email or password"
      redirect_to root_path
    end
  end
  
  def destroy
    session[:guest_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
end
