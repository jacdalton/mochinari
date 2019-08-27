class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :uikit, :user_map]

  def home
    @tags = ActsAsTaggableOn::Tag.most_used(8)
    @categories = Category.all.take(4)
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
