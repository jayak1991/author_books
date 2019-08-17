class Review < ApplicationRecord
  belongs_to :book

  def self.search(q)
    search_q = []
    q.split.uniq.each do |w|
      search_q << w.strip.downcase
    end
    condition = []
    ["name_of_reviewer", "review_title", "review_description"].each do |column|
      search_q.each do |str|
        condition << " LOWER(#{column}) LIKE '%#{str}%' "
      end
    end
    condition.present? ? Review.where(condition.join(" OR ")) : []
  end
end
