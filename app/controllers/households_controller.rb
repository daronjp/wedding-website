class HouseholdsController < ApplicationController
  
  before_filter :gate_keeper
  
  def index
    Galileo.create(:controller => 'households',
                     :view => 'index',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id],
                     :ip => request.remote_ip)
    if(params.has_key?(:household_name) && params.has_key?(:postal))
      @household = Guest.joins(:household).where("lower(guests.family_name) = ? and lower(postal) = ?", params[:household_name].downcase, params[:postal].downcase)
      Galileo.create(:controller => 'households',
                     :view => 'index_submit',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id],
                     :ip => request.remote_ip,
                     :household => params[:household_name],
                     :aux => params[:postal])
      #@household = Household.where("lower(household_name) = ? and zip = ?", params[:household_name].downcase, params[:zip])
      if @household.count > 0
        @householdGuests = @household[0].household.guests
        @guests = Guest.where("household_id = ?", @household[0].household.id).order(:id)
      end
      #redirect_to household_path(@household[0].id.to_i)
    end
    @plus_one = Guest.new
    
  end
  
  def show
    @guests = Guest.where("household_id = ?", params[:id])
  end
  
  def update
    Guest.update(params[:guest].keys, params[:guest].values)
    redirect_to households_path
  end
  
  def update_multiple
    #@household = Household.where("lower(household_name) = ? and zip = ?", params[:household_name].downcase, params[:zip])
    if params[:commit] == 'Create Guest'
      @plus_one = Guest.new(params[:guest])
      @plus_one.save
      Galileo.create(:controller => 'households',
                     :view => 'index_plus_one',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id],
                     :ip => request.remote_ip,
                     :household => params[:household_name],
                     :aux => params[:postal],
                     :food => params[:guest][:given_name] << params[:guest][:family_name])
    end
    if params[:commit] == 'Submit Preferences'
      Guest.update(params[:guest].keys, params[:guest].values)
      Household.update(params[:household_id], :email => params[:email], :logins => params[:logins])
      Galileo.create(:controller => 'households',
                     :view => 'index_update',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id],
                     :ip => request.remote_ip,
                     :household => params[:household_name],
                     :aux => params[:postal])
      @email = params[:email]
      flash[:notice] = "Options updated!"
    end
    redirect_to households_path(:household_name => params[:household_name], :postal => params[:postal])
  end
  
  def edit_multiple
  end
  
end
