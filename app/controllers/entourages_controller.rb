class EntouragesController < ApplicationController
  
  before_filter :gate_keeper
  
  def index
    @entourage = Entourage.order(:gender, :rank)
  end
  
end
