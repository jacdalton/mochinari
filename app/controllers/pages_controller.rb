class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :uikit, :user_map]

  def home
    @tags = ActsAsTaggableOn::Tag.most_used(8)
    @categories = Category.all.take(4)
    @tags = @tags.map { |tag| tag.name }
    @snacks = Snack.all
  end

  def uikit
  end

  def user_map
    @snacks = Snack.geocoded
    @markers = @snacks.map do |snack|
      {
        lat: snack.latitude,
        lng: snack.longitude
      }
    end
    @icon = helpers.asset_url("map marker.png")

  end

  def my_bio
  end

  def my_mochies
  end

end
