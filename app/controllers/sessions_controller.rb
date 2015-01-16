class SessionsController < ApplicationController
  
  skip_before_filter :gate_keeper
  
  def new
  end
  
  def create
    visitor = Visitor.authenticate(params[:group], params[:password])
    if visitor
      session[:visitor_id] = visitor.id
      flash[:notice] = "Welcome!"
      redirect_to root_path
    else
      flash[:notice] = "Invalid email or password"
      redirect_to root_path
    end
  end
  
  def destroy
    session[:visitor_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
end
