class ArticlesController < ApplicationController
  before_filter :authenticate_user!
  expose(:article, attributes: :article_params)
  expose(:review) { new_review }

  def index
    @review_articles = Article.where(reviewer_id: current_user.id)
    @articles = Article.where(user: current_user)
  end

  def create
    article.user_id = current_user.id
    if article.save
      flash[:notice] = 'Article was successfully created.'
      redirect_to articles_path
    end
  end

  def update
    if article.update(article_params)
      flash[:notice] = 'Article was successfully updated.'
      redirect_to articles_path
    end
  end

  def destroy
    article.destroy
    redirect_to articles_path
  end

  private

  def new_review
    review = Review.new
    review.article_id = article.id
    review
  end

  def article_params
    params.require(:article).permit(:title, :content, :summary, :keywords, :reviewer_id)
  end
end
