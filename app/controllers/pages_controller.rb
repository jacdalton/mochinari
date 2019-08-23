class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :uikit]

  def home
    @tags = ActsAsTaggableOn::Tag.most_used(8)
    @categories = Category.all
    @snacks = Snack.all
  end

  def uikit
  end
end
