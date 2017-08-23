class WishlistsController < ApplicationController
  def index
    @wishlist = Wishlist.new
    @wishlists = policy_scope(Wishlist)
  end

  def create
  
    wishlist = current_user.wishlists.new(wishlist_params)
    authorize wishlist
    if wishlist.save
      flash[:notice] = "Wishlist created"
      redirect_to wishlists_path
    else
      flash[:alert] = "Can't create a wishlist"
      redirect_to wishlists_path
    end
  end

  def destroy
    wishlist = Wishlist.find(params[:id])
    authorize wishlist
    wishlist.destroy
    flash[:notice] = "Wishlist deleted"
    redirect_to wishlists_path
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(:name)
  end
end
