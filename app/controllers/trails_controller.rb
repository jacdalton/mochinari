class TrailsController < ApplicationController
  before_action :filter_snacks_params, only: [:update]
  before_action :set_trail, only: [:show, :edit, :update, :destroy, :toggle_edit, :toggle_show]
  def index
    # once pundit is implemented this will likely change
    @trails = Trail.all
  end

  def show
    @snacks = @trail.snacks
    @markers = @snacks.map do |snack|
      {
        lat: snack.latitude,
        lng: snack.longitude,
        infoWindow: { content: render_to_string(partial: "/snacks/info_window", locals: { snack: snack }) },
        icon: helpers.asset_url("map marker.png")
      }
    end
    @icon = helpers.asset_url("map marker.png")
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
    favorited_snacks = current_user.all_favorited
    all_near_snacks = Snack.near(@trail.to_coordinates, 5, units: :km)

    @near_favorited_snacks = all_near_snacks.select { |snack| snack.favorited_by?(current_user) }
    @far_favorited_snacks = favorited_snacks - @near_favorited_snacks
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
      @value = "removed"
    else
      @trail.snacks << @snack
      @value = "added"
    end
    respond_to do |format|
      format.js
    end
  end

  def toggle_show
    @snack = Snack.find(params[:snack])

    if @trail.snacks.include?(@snack)
      @trail.snacks.delete(@snack)
      @value = "removed"
    else
      @trail.snacks << @snack
      @value = "added"
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
