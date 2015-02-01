class ReviewsController < ApplicationController
  before_filter :authenticate_user!
  expose(:review) { review_params }
  expose(:reviews)

  def create
    review = Review.new(review_params)
    review.article_id = params[:article_id]
    flash[:notice] = t('review.successfully_created') if review.save
    redirect_to articles_path
  end

  def update
    flash[:notice] = t('review.successfully_updated') if review.update(review_params)
  end

  def destroy
    review.destroy
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:article_id, :comment, :decision)
    end
end
