class ApplicationController < ActionController::Base
  #protect_from_forgery
  
  protect_from_forgery with: :exception
  
  #before_action :gate_keeper
  before_filter :gate_keeper
  skip_before_filter :gate_keeper, only: [:index]
  
  helper_method :current_agent
  
  private

  def current_agent
    @current_agent ||= Agent.find(session[:agent_id]) if session[:agent_id]
  end

  def gate_keeper
    if session[:agent_id]
    else
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path
    end  
  end
  
    
  def admin_only
    if current_agent.is_admin
    else
      redirect_to :back, :flash => { :not_authorized => "Page blocked!" }
    end  
  end
  
end
