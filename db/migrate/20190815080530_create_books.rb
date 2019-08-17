class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name_of_book
      t.text :short_description
      t.text :long_description
      t.integer :book_chapter_index
      t.date :date_of_publication
      t.text :genre, array: true, default: []

      t.timestamps
    end
  end
end
