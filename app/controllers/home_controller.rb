class HomeController < ApplicationController

  def registry
    @honey_url = 'http://honeyfund.com/wedding/eimeeanddaron'
    @target_url = 'http://bit.ly/george_ryan_registry_1'
    @macys_url = 'http://bit.ly/george_ryan_registry_2'
    @pottery_barn_url = 'http://bit.ly/george_ryan_registry_3'
    @amazon_url = 'http://amzn.to/george_ryan_registry'
  end

  def inbound_email
    errors = validate_inbound_email params
    respond_to do |format|
      if errors.empty? && ContactMailer.inbound_email(params[:email], params[:subject], params[:message]).deliver
        flash[:notice] = 'Email successfully sent!'
        format.html { redirect_to(contact_path) }
      else
        flash[:error] = "There was a problem sending your email: "
        flash[:error] += errors.join "\n" unless errors.empty?
        format.html { redirect_to(contact_path) }
      end
    end
  end

  def validate_inbound_email params
    errors = []
    errors << "Email can't be blank.  " if params[:email].blank?
    errors << "Name can't be blank.  " if params[:name].blank?
    errors << "Subject can't be blank.  " if params[:subject].blank?
    errors << "Message can't be blank." if params[:message].blank?
    errors
  end
  
  def directions
    
    Galileo.create(:controller => 'home',
                     :view => 'directions',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
    
  end
  
  def index
    
    Galileo.create(:controller => 'home',
                     :view => 'index',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
    
  end
  
  def lodging
    
    Galileo.create(:controller => 'home',
                     :view => 'lodging',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
    
  end
  
  def registry
    
    Galileo.create(:controller => 'home',
                     :view => 'registry',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
    
  end
  
  
  def wedding_party
    
    Galileo.create(:controller => 'home',
                     :view => 'wedding_party',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
    
  end

end