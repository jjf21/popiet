class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @places = [Place.find(148), Place.find(88), Place.find(527), Place.find(537)]
    @wishlist = Wishlist.new
    @products = Product.first(4)
  end
end
