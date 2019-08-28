class SnacksController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :tagged ]

  def index
    # once search, tags, and map are implemented this will change
    tags_arr = ActsAsTaggableOn::Tag.all.map { |t| t.name }
    if params[:search][:query].present? && tags_arr.include?(params[:search][:query])
      @snacks = Snack.tag_search(params[:search][:query])
    elsif params[:search][:query].present?
      @snacks = Snack.search_by_name_and_description(params[:search][:query])
    else
      @snacks = Snack.all
    end
  end

  def show
    @snack = Snack.find(params[:id])
    @heart =
    if !current_user.nil?
      @snack.favorited_by?(current_user) ? "pink-heart.svg" : "like.svg"
    else
      "like.svg"
    end

    @markers = [{
      lat: @snack.latitude,
      lng: @snack.longitude
    }]
    @snack_rating =
      if !current_user.nil?
        if !current_user.snack_ratings.find_by(snack: @snack).nil?
          current_user.snack_ratings.find_by(snack: @snack)
        else
          SnackRating.new
        end
      else
        SnackRating.new
      end

    @tags = @snack.tag_list
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

  def tagged
    if params[:tag].present?
      @tag = params[:tag]
      @snacks = Snack.tagged_with(@tag)
    else
      @snacks = Snack.all
    end
  end

  private

  def snack_params
    params.require(:snack).permit(:name, :description, :shop_name, :shop_location, :category, :tag_list)
  end
end
