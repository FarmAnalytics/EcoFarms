class FarmsController < ApplicationController

  def index
    @farms = policy_scope(Farm).geocoded
    @markers = @farms.map do |farm|
      {
        lat: farm.latitude,
        lng: farm.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { farm: farm }),
        image_url: helpers.asset_url('farmer.png')
      }
    end
  end

  def show
    @farm = Farm.find(params[:id])
    @user = current_user
    @shop = Shop.where(user_id: @user.id).first
    authorize @farm

    @wish_lists = List.where(shop_id: Shop.where(user_id: current_user.id))
    @list = List.new
  end
end
