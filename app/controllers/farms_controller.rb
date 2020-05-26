class FarmsController < ApplicationController
  def show
    @farm = Farm.find(params[:id])
    authorize @farm
  end
end
