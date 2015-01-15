class VisitorsController < ApplicationController
  
  skip_before_filter :gate_keeper
  
  def new
  end
  
  def create
    visitor = Visitor.authenticate(params[:email], params[:password])
    if visitor
      session[:visitor_id] = visitor.id
      redirect_to root_path
    else
      flash[:notice] = "Invalid email or password"
      redirect_to root_path
    end
  end
  
  def destroy
    session[:visitory_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
end
