class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :content
      t.text :summary
      t.string :keywords
      t.references :user, index: true

      t.timestamps
    end
  end
end
