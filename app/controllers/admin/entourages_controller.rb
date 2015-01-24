class Admin::EntouragesController < ApplicationController
  
  before_filter :admin_only
  
  def new
    @entourage = Entourage.new
    
    Galileo.create(:controller => 'admin_entourages',
                     :view => 'new',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
  end
  
  def create
    @entourage = Entourage.new(params[:entourage])
      
    if @entourage.save
      redirect_to admin_entourages_path, :notice => "Wedding Party Individual Created!"
    else
      render "new"
    end
  end
  
  def index
    @entourage = Entourage.order(:rank, :gender)
    
    Galileo.create(:controller => 'admin_entourages',
                     :view => 'index',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
  end
  
  def edit
    @entourage = Entourage.find(params[:id])
    
    Galileo.create(:controller => 'admin_entourages',
                     :view => 'edit',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
  end
  
  def update
    @entourage = Entourage.find(params[:id])
    
    if @entourage.update_attributes(params[:entourage])
      
      Galileo.create(:controller => 'admin_entourages',
                     :view => 'update',
                     :user_id => session[:visitor_group],
                     :session => request.session_options[:id])
      
      redirect_to admin_entourages_path
    else
      render 'edit'
    end
  end
  
  
end
