class FarmsController < ApplicationController

  def index
    @farms = policy_scope(Farm).geocoded
    @markers = @farms.map do |farm|
      {
        lat: farm.latitude,
        lng: farm.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { farm: farm }),
        # image_url: helpers.asset_url('app/assets/images/farmer.png')
      }
    end
  end

  def show
    @farm = Farm.find(params[:id])
    authorize @farm
  end
    
end
