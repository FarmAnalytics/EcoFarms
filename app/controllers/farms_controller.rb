class FarmsController < ApplicationController

  def index
    @farms = policy_scope(Farm)
    @markers = @farms.map do |farm|
      {
        lat: farm.latitude,
        lng: farm.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { farm: farm })
      }
    end
  end

  def show
    @farm = Farm.find(params[:id])
    authorize @farm
  end
    
end
