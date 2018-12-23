class ReviewsController < ApplicationController
  before_action :find_cocktail, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.cocktail = Cocktail.find(params[:cocktail_id])
    if @review.save
      redirect_to cocktail_path(@review.cocktail)
    else
      render :new
    end
  end

  # def destroy
  #   @dose = Dose.find(params[:id])
  #   @cocktail = @dose.cocktail
  #   @dose.destroy
  #   redirect_to cocktail_path(@cocktail)
  # end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating, :cocktail_id)
  end

end
