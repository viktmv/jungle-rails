class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    @product = Product.find(params[:product_id])

    if current_user.blank?
      redirect_to '/login'
    else
    @product.reviews.create!(
      user: current_user,
      description: review_params[:description],
      rating: review_params[:rating]
    )
    redirect_to product_path(params[:product_id])
    end
  end


  def destroy
    Review.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to product_path(params[:product_id]), notice: 'review was successfully destroyed.' }
    end
  end

  private
  def authorize
    unless current_user.present?
      redirect_to '/login'
    end
  end

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
