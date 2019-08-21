class SnackImagesController < ApplicationController
  before_action :set_snack_image, only: [:show, :edit, :update, :destroy]
  def index
    # once we implement Pundit this should probably change
    @snack_images = SnackImage.all
  end

  def show
  end

  def new
    @snack_image = SnackImage.new
  end

  def create
    @snack_image = SnackImage.new(snack_image_params)
    @snack_image.snack = Snack.find(params[:snack_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def snack_image_params
    params.require(:snack_image).permit(:snack, :image_path, :comment)
  end

  def set_snack_image
    @snack_image = SnackImage.find(params[:snack_id])
  end

end
