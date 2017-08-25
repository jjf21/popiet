class WishlistsController < ApplicationController
  def index
    @wishlist = Wishlist.new
    @wishlists = policy_scope(Wishlist)
  end

  def create
    if !params[:place_id].blank?
      @place = Place.find(params[:place_id])
    end
    @wishlist = current_user.wishlists.new(wishlist_params)
    authorize @wishlist

    if @wishlist.save
      respond_to do |format|
        format.html { redirect_to wishlists_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'wishlists/index' }
        format.js  # <-- idem
      end
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
