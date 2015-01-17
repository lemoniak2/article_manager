class AddReviewerToArticle < ActiveRecord::Migration
  def change
    add_reference :articles, :reviewer, index: true
  end
end
