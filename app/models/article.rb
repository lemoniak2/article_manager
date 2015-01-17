class Article < ActiveRecord::Base
  resourcify
  belongs_to :user
  has_one :review

  def no_review
    review ? false : true
  end
end
