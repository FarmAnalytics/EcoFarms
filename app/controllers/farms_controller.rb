class FarmsController < ApplicationController

  def index

    @tags = ['Légumes', 'Fruits', 'Viande', 'Crèmerie', 'Vin']
    @farms = policy_scope(Farm).geocoded

    if params[:search].present? && params[:search][:query] != ''
     @farms = policy_scope(Farm.geocoded.near(params[:search][:query])).tagged_with(params[:type])
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
    @user = current_user
    @shop = Shop.where(user_id: @user.id).first
    authorize @farm

    @wish_lists = List.where(shop_id: Shop.where(user_id: current_user.id))
    @list = List.new

    @clap = Clap.new
  end

  def count_clap
    skip_authorization
    @claps = Clap.where(farm_id: params[:id]).count
    respond_to do |format|
      format.json { render json: { clapsCount: @claps } }
     end
  end
end
