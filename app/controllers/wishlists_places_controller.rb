class WishlistsPlacesController < ApplicationController

  def create
    place = Place.find(params[:place_id])
    if !current_user.wishlists.nil?
      #ONLY ONE WISHLIST
      wishlist_id = current_user.wishlists.first.id
      wish_place = place.wishlists_places.new(wishlist_id: wishlist_id)
    else
      flash[:alert] = "Please Create a wishlist first"
      return redirect_to wishlists_path(place)
    end
    authorize wish_place


    if wish_place.save
      flash[:notice] = "Added to your wishlist added"
      redirect_to wishlists_path(place)
    else
      flash[:alert] = "Can't add to wishlist"
      redirect_to place_path(place)
    end

  end

  def destroy
  end

end
