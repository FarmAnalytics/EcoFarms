class ClapsController < ApplicationController

  def create
    @farm = Farm.find(params[:farm_id])
    authorize @farm
    @user = current_user
    authorize @user
    @clap = Clap.new
    @clap.user = @user
    @clap.farm = @farm
    @clap.save
  end
  
end
