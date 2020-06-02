class ShopsController < ApplicationController

  def show
  end

  def edit
  end

  def create
    @shop = Shop.new(shop_params.merge(user: current_user))
    authorize @shop
    if @shop.save
      flash[:notice] = "Votre magasin a été créé"
      redirect_to profile_user_path
    else
      render :new
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:address)
  end
end
