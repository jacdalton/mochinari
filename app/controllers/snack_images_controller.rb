class SnackImagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_snack_image, only: [:show, :edit, :update, :destroy]
  before_action :set_snack, only: [:new, :create, :edit, :update, :destroy]
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
    @snack = Snack.find(params[:snack_id])
    @snack_image = SnackImage.new(snack_image_params)
    @snack_image.snack = @snack
    @snack_image.user = current_user
    if @snack_image.save
      redirect_to snack_path(@snack)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @snack_image.update(snack_image_params)
      redirect_to snack_path(@snack)
    else
      render :edit
    end
  end

  def destroy
    @snack_image.destroy
    redirect_to snack_path(@snack)
  end

  private

  def snack_image_params
    params.require(:snack_image).permit(:image_path, :comment)
  end

  def set_snack_image
    @snack_image = SnackImage.find(params[:id])
  end

  def set_snack
    @snack = Snack.find(params[:snack_id])
  end
end
