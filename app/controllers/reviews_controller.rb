class ReviewsController < ApplicationController
  before_action :find_cocktail, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.cocktail = Cocktail.find(params[:cocktail_id])
    @all_ratings = []
    @cocktail.average_rating = 0
    @cocktail.reviews.each do |review|
      @all_ratings << review.rating
    end
    if @review.save
      @cocktail.average_rating = @all_ratings.sum.to_f / @all_ratings.count.to_f
      @cocktail.save
      respond_to do |format|
        format.html { redirect_to cocktail_path(@cocktail) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "cocktails/show" }
        format.js
      end
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
