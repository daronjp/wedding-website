class Admin::HouseholdsController < ApplicationController
  
  before_filter :admin_only
  
  def new
    @household = Household.new
    @seq=*(1..6)
    
    Galileo.create(:controller => 'admin_household',
                     :view => 'new',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
  end
  
  def create
    @household = Household.new(params[:household])
      
    if @household.save
      
      Galileo.create(:controller => 'admin_household',
                     :view => 'create',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
      
      redirect_to admin_households_path, :notice => "Household Created!"
    else
      render "new"
    end
  end
  
  def index
    @household = Household.all
    
    Galileo.create(:controller => 'admin_household',
                     :view => 'index',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
  end
  
  def show
    @household = Household.find(params[:id])
    
    Galileo.create(:controller => 'admin_household',
                     :view => 'show',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
    
  end
  
  def edit
    @household = Household.find(params[:id])
    @seq=*(1..6)
    
    Galileo.create(:controller => 'admin_household',
                     :view => 'edit',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
  end
  
  def update
    @household = Household.find(params[:id])
    
    if @household.update_attributes(params[:household])
      
      Galileo.create(:controller => 'admin_household',
                     :view => 'update',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
      
      redirect_to admin_household_path(@household)
    else
      render 'edit'
    end
  end
  
end
