class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :article, index: true
      t.text :comment
      t.integer :decision

      t.timestamps
    end
  end
end
