class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :uikit, :map]

  def home
    @tags = ActsAsTaggableOn::Tag.most_used(8)
    @categories = Category.all
    @snacks = Snack.all
  end

  def uikit
  end

  def user_map
  end
end
