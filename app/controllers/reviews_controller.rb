class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])

    p review_params

    if current_user.blank?
      redirect_to '/'
    else
    @product.reviews.create!(
      user: current_user,
      description: review_params[:description],
      rating: review_params[:rating]
    )
    render '/products/show', product: @product
    end
  end


  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
