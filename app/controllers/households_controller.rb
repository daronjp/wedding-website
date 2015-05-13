class HouseholdsController < ApplicationController
  
  def index
    if(params.has_key?(:household_name) && params.has_key?(:zip))
      @household = Guest.joins(:household).where("lower(guests.family_name) = ? and zip = ?", params[:household_name].downcase, params[:zip])
      
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
    end
    if params[:commit] == 'Submit Preferences'
      Guest.update(params[:guest].keys, params[:guest].values)
      Household.update(params[:household_id], :email => params[:email], :logins => params[:logins])
      @email = params[:email]
      flash[:notice] = "Options updated!"
    end
    redirect_to households_path(:household_name => params[:household_name], :zip => params[:zip])
  end
  
  def edit_multiple
  end
  
end
