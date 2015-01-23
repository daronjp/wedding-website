class Admin::VisitorsController < ApplicationController
  
  before_filter :admin_only
  
  def new
    @visitor = Visitor.new
    
    Galileo.create(:controller => 'admin_visitor',
                     :view => 'new',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
    
  end
  
  def create
    @visitor = Visitor.new(params[:visitor])
      
    if @visitor.save
      
      Galileo.create(:controller => 'admin_visitor',
                     :view => 'create',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
      
      redirect_to admin_visitors_path, :notice => "Visitor Created!"
    else
      render "new"
    end
  end
  
  def index
    @visitor = Visitor.all
    
    Galileo.create(:controller => 'admin_visitor',
                     :view => 'index',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
    
  end
  
end
