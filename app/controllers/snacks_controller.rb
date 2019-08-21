class SnacksController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    # once search, tags, and map are implemented this will change
    @snacks = Snack.all
  end

  def show
    @snack = Snack.find(params[:id])
  end

  def new
    @snack = Snack.new
  end

  def create
    @snack = Snack.new(snack_params)
    @snack.user = current_user
    if @snack.save
      redirect snack_path(@snack)
    else
      render :new
    end
  end

  private

  def snack_params
    params.require(:snack).permit(:name, :description, :shop_name, :shop_location, :category)
  end
end