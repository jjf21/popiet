class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @places = Place.last(6)
    @wishlist = Wishlist.new
  end
end
