class SnacksController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    # once search, tags, and map are implemented this will change
    @snacks = Snack.all
  end

  def show
    @snack = Snack.find(params[:id])
    @icon = @snack.favorited_by?(current_user) ? "s" : "r"
    @snack.geocode
    @snack.save
    @markers = [{
      lat: @snack.latitude,
      lng: @snack.longitude
    }]
  end

  def new
    @snack = Snack.new
  end

  def create
    @snack = Snack.new(snack_params)
    @snack.user = current_user
    if @snack.save
      redirect_to snack_path(@snack)
    else
      render :new
    end
  end

  def favorites
    @snacks = current_user.all_favorited
  end

  def favorite
    # @value = nil
    @snack = Snack.find(params[:id])
    @user = current_user
    if @snack.favorited_by?(@user)
      @user.unfavorite(@snack)
      @value = "false"
    else
      @user.favorite(@snack)
      @value = "true"
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def snack_params
    params.require(:snack).permit(:name, :description, :shop_name, :shop_location, :category)
  end
end
