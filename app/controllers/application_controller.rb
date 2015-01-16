class ApplicationController < ActionController::Base
  #protect_from_forgery
  protect_from_forgery with: :exception
  
  ####before_action :gate_keeper
  before_filter :gate_keeper
  skip_before_filter :gate_keeper, only: [:index]
  
  helper_method :current_visitor
  
  private

  def current_visitor
    @current_visitor ||= Visitor.find(session[:visitor_id]) if session[:visitor_id]
  end

  def gate_keeper
    #if session[:visitor_id]
    if current_visitor
    else
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path
    end  
  end
  
    
  def admin_only
    if current_visitor.is_admin
    else
      redirect_to :back, :flash => { :not_authorized => "Page blocked!" }
    end  
  end
  
end
