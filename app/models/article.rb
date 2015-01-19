class Article < ActiveRecord::Base
  mount_uploader :article_content, ArticleContentUploader
  resourcify
  belongs_to :user
  has_one :review

  def no_review
    review ? false : true
  end
end
