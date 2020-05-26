class FarmsController < ApplicationController

  def index
    @farms = policy_scope(Farm)
    @markers = @farms.map do |farm|
      {
        lat: farm.latitude,
        lng: farm.longitude
      }
    end
  end

  def show
    @farm = Farm.find(params[:id])
    authorize @farm
  end
    
end
