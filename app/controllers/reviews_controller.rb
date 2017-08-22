class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    place = Product.find(params[:product_id])
    review = place.reviews.new(product_params)


    if review.save
      flash[:notice] = "Review added"
      redirect_to product_path(product)
    else
      flash[:alert] = "Can't add the review"
      redirect_to product_path(product)
    end


  end
  
  private

  def product_params
    params.require(:review).permit(
                                    :content,
                                    :rating,
                                    :user_id
                                    )
  end
end
