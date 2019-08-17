class CreateAuthorsBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :authors_books do |t|
      t.references :author, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end

    add_index :authors_books, [:author_id, :book_id], unique: true
  end
end
