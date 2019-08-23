class TrailsController < ApplicationController
  before_action :filter_snacks_params, only: [:create, :update]
  before_action :set_trail, only: [:show, :edit, :update, :destroy]
  def index
    # once pundit is implemented this will likely change
    @trails = Trail.all
  end

  def show
    @snacks = @trail.snacks
    @markers = @snacks.map do |snack|
      snack.geocode
      {
        lat: snack.latitude,
        lng: snack.longitude
      }
    end
  end

  def new
    @trail = Trail.new
    @snacks = Snack.all
  end

  def create
    @trail = Trail.new(trail_params)
    @trail.user = current_user
    @trail.geocode
    @trail.snacks = params[:trail][:snacks]
    # binding.pry
    if @trail.save
      redirect_to trail_path(@trail)
    else
      render :new
    end
  end

  def edit
    # this will need to change once the favoritable gem is installed
    @snacks = Snack.all
  end

  def update
    # not sure how to implement this correctly
    if @trail.update(trail_params)
      redirect_to trail_path(@trail)
    else
      render :show
    end
  end

  def destroy
    @trail.destroy
    redirect_to trails_path
  end

  def my_trails
    @trails = Trail.where(user: current_user)
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
