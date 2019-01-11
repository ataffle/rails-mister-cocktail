class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @review = Review.new
    @all_ratings = []
    @cocktail.average_rating = 0
    @cocktail.reviews.each do |review|
      @all_ratings << review.rating
    end
    @cocktail.average_rating = @all_ratings.sum.to_f / @all_ratings.count.to_f
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
