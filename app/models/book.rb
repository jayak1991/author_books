class Book < ApplicationRecord
  has_many :authors_books, dependent: :destroy
  has_many :authors, through: :authors_books

  GENRES = {
      "science" => "Science fiction",
      "fiction" => "Science fiction",
      "satire" => "Satire",
      "drama" => "Drama",
      "action" => "Action and Adventure",
      "adventure" => "Action and Adventure",
      "romance" => "Romance",
      "mystery" => "Mystery",
      "horror" => "Horror",
      "self" => "Self help",
      "help" => "Self help",
      "fantasy" => "Fantasy"
  }

  def self.search(q)
    search_q = []
    q.split.uniq.each do |w|
      search_q << w.strip.downcase
    end
    condition = []
    ["name_of_book", "short_description", "long_description", "genre"].each do |column|
      search_q.each do |str|
        if column == "genre"
          condition << " '#{GENRES[str]}' = ANY (genre) " if GENRES.keys.include? str
        else
          condition << " LOWER(#{column}) LIKE '%#{str}%' "
        end
      end
    end
    condition.present? ? Book.where(condition.join(" OR ")) : []
  end
end
