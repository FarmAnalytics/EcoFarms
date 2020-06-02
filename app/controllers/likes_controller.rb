class LikesController < ApplicationController
  def create
    @farm = Farm.find(params[:farm_id])
    authorize @farm
    @list = List.find(params[:params_list])
    authorize @list
    @like = Like.new

    @like.farm_id = @farm.id
    @like.list_id = @list.id
    if @like.save
      flash[:notice] = "La ferme a été ajoutée à votre liste"
      redirect_to user_lists_path
    else
      render :new
    end
  end

  def destroy
    @like = Like.find(params[:id])
    authorize @like
    @like.destroy
    flash[:notice] = "La ferme a été supprimée de votre liste"
    redirect_to user_lists_path
  end
end
