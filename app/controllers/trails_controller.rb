class TrailsController < ApplicationController
  before_action :set_trail, only: [:show, :edit, :update, :destroy]
  def index 
    # once pundit is implemented this will likely change
    @trails = Trail.all
  end

  def show
  end

  def new
    @trail = Trail.new
  end

  def create
    @trail = Trail.new(trail_params)
    @trail.user = current_user
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

  private

  def trail_params
    params.require(:trail).permit(:name, :location)
  end

  def set_trail
    @trail = Trail.find(params[:id])
  end
end