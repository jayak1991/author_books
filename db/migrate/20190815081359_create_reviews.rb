class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :name_of_reviewer
      t.decimal :star_rating
      t.string :review_title
      t.text :review_description
      t.references :book

      t.timestamps
    end
  end
end
