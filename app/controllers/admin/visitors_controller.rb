class Admin::VisitorsController < ApplicationController
  
  def new
    @visitor = Visitor.new
  end
  
  def create
    @visitor = Visitor.new(params[:visitor])
      
    if @visitor.save
      redirect_to admin_visitors_path, :notice => "Visitor Created!"
    else
      render "new"
    end
  end
  
  def index
  end
  
end
