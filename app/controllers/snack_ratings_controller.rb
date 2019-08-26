class SnackRatingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_snack, only: [:show, :create, :new]

  def show
    @snack_stars = @snack.avg_snack_stars
  end

  def new
    @snack_rating = SnackRating.new
  end

  def create
    @snack_rating = SnackRating.new(snack_ratings_params)
    @snack_rating.snack = @snack
    @snack_rating.user = current_user
    if @snack_rating.save
      redirect_to snack_path(@snack)
    else
      render :new
    end
  end

  private

  def set_snack
    @snack = Snack.find(params[:snack_id])
  end

  def snack_ratings_params
    params.require(:snack_rating).permit(:stars, :snack_id, :user_id)
  end
end
