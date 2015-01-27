class HomeController < ApplicationController

  def registry
    @honey_url = 'http://honeyfund.com/wedding/eimeeanddaron'
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
  
  def details
    @honey_url = 'http://honeyfund.com/wedding/eimeeanddaron'
    @registry_url = 'http://www.myregistry.com/wedding-registry/Eimee-Rivera-Daron-Peugh-Portland-OR/797211'
    @glassybaby_url = 'http://glassybaby.com/registry/24396'
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
  
  def directions
    render :layout => "map"
  end
  
  def hashtags
    require 'instagram'
    
    Instagram.configure do |config|
      config.client_id = "5e2d29b639fb4fb2a527374697bf7dd3"
      config.client_secret = "a9f8bae7b40e4fa589e64946c04318e6"
    end
    
    h = "5e2d29b639fb4fb2a527374697bf7dd3"
    client = Instagram.client(:client_id => h)
    #html = "<h1>Search for tags, get tag info and get media by tag</h1>"
    @tags = client.tag_search('cat')
    @me = client.user_search('daronjp')
    @pop = client.media_popular
    @sea = client.tag_recent_media('seahawk')
    #@html << "<h2>Tag Name = #{tags[0].name}. Media Count =  #{tags[0].media_count}. </h2><br/><br/>"
    #for media_item in client.tag_recent_media(tags[0].name)
    #  html << "<img src='#{media_item.images.thumbnail.url}'>"
    #end
    #html



    #@pics =  "https://api.instagram.com/v1/tags/nofilter/media/recent?client_id=5e2d29b639fb4fb2a527374697bf7dd3"  
    
  end

end