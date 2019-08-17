class Author < ApplicationRecord
  has_one_attached :profile_pic

  has_many :authors_books, dependent: :destroy
  has_many :books, through: :authors_books

  def self.search(q)
    search_q = []
    q.split.uniq.each do |w|
      search_q << w.strip.downcase
    end
    condition = []
    ["name", "author_bio", "academics", "awards"].each do |column|
      search_q.each do |str|
        condition << " LOWER(#{column}) LIKE '%#{str}%' "
      end
    end
    condition.present? ? Author.where(condition.join(" OR ")) : []
  end
end
