class ReviewsController < ApplicationController
  def create
    @pet = Pet.find(params[:pet_id])
    @review = Review.new(review_params)
    @review.pet = @pet
    @review.user = current_user
    p @review.valid?
    p @review
    if @review.save
      redirect_to pet_path(@pet)
    else
      @sitting = Sitting.new
      render "pets/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
