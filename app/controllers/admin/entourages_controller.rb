class Admin::EntouragesController < ApplicationController
  
  before_filter :admin_only
  
  def new
    @entourage = Entourage.new
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
    @entourage = Entourage.order(:gender, :rank)
  end
  
  def edit
    @entourage = Entourage.find(params[:id])
  end
  
  def update
    @entourage = Entourage.find(params[:id])
    
    if @entourage.update_attributes(params[:entourage])
      redirect_to admin_entourages_path
    else
      render 'edit'
    end
  end
  
  
end
