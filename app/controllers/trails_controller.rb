class TrailsController < ApplicationController
  before_action :filter_snacks_params, only: [:update]
  before_action :set_trail, only: [:show, :edit, :update, :destroy, :toggle_edit]
  def index
    # once pundit is implemented this will likely change
    @trails = Trail.all
  end

  def show
    @snacks = @trail.snacks
    @markers = @snacks.map do |snack|
      {
        lat: snack.latitude,
        lng: snack.longitude
      }
    end
  end

  def new
    @trail = Trail.new
    @snacks = current_user.all_favorited
  end

  def create
    @trail = Trail.new(trail_params)
    @trail.user = current_user
    if @trail.save
      redirect_to edit_trail_path(@trail)
    else
      render :new
    end
  end

  def edit
    @snacks = current_user.all_favorited
  end

  def destroy
    @trail.destroy
    redirect_to my_trails_path
  end

  def my_trails
    @trails = Trail.where(user: current_user)
    @trail = Trail.new
    # @trail_image == trail.snacks.exists? ? trail.snacks[0].snack_images[0].image_path : "mochinarilogo.png"
  end

  def toggle_edit
    @snack = Snack.find(params[:snack])

    if @trail.snacks.include?(@snack)
      @trail.snacks.delete(@snack)
      @value = "false"
    else
      @trail.snacks << @snack
      @value = "true"
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def trail_params
    params.require(:trail).permit(:name, :location, { snacks: [] })
  end

  def filter_snacks_params
    params[:trail][:snacks] = params[:trail][:snacks].reject(&:blank?).map { |id| Snack.find(id) }
  end

  def set_trail
    @trail = Trail.find(params[:id])
  end
end
