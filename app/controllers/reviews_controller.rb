class ReviewsController < ApplicationController

  def new
    @place = Place.find(params[:place_id])
    @review = Review.new
    authorize @review
  end

  def create
    place = Place.find(params[:place_id])
    review = place.reviews.new(place_params)
    authorize review


    if review.save
      flash[:notice] = "Review added"
      redirect_to place_path(place)
    else
      flash[:alert] = "Can't add the review"
      redirect_to place_path(place)
    end


  end
  
  private

  def place_params
    params.require(:review).permit(:content,:rating,:user_id)
  end
end
