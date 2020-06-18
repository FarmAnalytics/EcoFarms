class FarmsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

    @tags = ['Elevage', 'Grandes Cultures', 'Maraîchage', 'Viticulture', 'Arboriculture']
    @farms = policy_scope(Farm).geocoded
    
    if params[:tag].present?
      @farms = policy_scope(Farm).geocoded.tagged_with(params[:tag], any: true)
    else
      @farms = policy_scope(Farm).geocoded
    end

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
    authorize @farm
    @chatroom = Chatroom.new
    @list = List.new
    @clap = Clap.new
    if current_user != nil
      @shop = Shop.where(user_id: current_user.id).first
      @wish_lists = List.where(shop_id: Shop.where(user_id: current_user.id))
    end
  end

  def count_clap
    skip_authorization
    @claps = Clap.where(farm_id: params[:id]).count
    respond_to do |format|
      format.json { render json: { clapsCount: @claps } }
     end
  end
end
