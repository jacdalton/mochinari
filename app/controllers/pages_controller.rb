class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :uikit, :map, :my_bio, :my_location, :my_mochies]

  def home
    @tags = ActsAsTaggableOn::Tag.most_used(8)
    @categories = Category.all
    @snacks = Snack.all
  end

  def uikit
  end

  def user_map
    @snacks = Snack.all
    @markers = []
    @snacks.each do |snack|
      snack.geocode
      snack.save
      @markers << {
        lat: snack.latitude,
        lng: snack.longitude
      }
    end
  end

  def my_bio
  end

  def my_mochies
  end

end
