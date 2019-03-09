class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def index
    @user = User.find_by(id: session[:user_id])
    @search_review = Search::Review.new
  end

  def create
    # @user.reviews.create or buildで作成できる
    @review = Review.new(review_params)
    @review.user_id = session[:user_id]
    if @review.valid?
      @review.save
    else
      logger.debug(@review.errors.messages)
    end
    @user = User.find_by(id: session[:user_id])
    @search_review = Search::Review.new
    render "index"
  end

  def search
    @review = Search::Review.new(search_params)
    @reviews = @review.matches
  end

  private
  def review_params
    params.require(:review).permit(:content, :star)
  end
  def search_params
    params
      .require(:search_review)
      .permit(Search::Review::ATTRIBUTES)
  end
end
