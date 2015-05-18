class EntouragesController < ApplicationController
  
  before_filter :gate_keeper
  
  def index
    @entourage = Entourage.order(:rank, :gender)
    
    Galileo.create(:controller => 'entourages',
                     :view => 'index',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id],
                     :ip => request.remote_ip)
  end
  
end
