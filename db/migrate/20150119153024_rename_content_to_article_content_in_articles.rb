class RenameContentToArticleContentInArticles < ActiveRecord::Migration
  def change
    rename_column :articles, :content, :article_content
  end
end
