class Category < ActiveRecord::Base
  validates :name, presence: true
  has_many :films

  def sort_by_rating
    self.films.sort_by{|film| film.total_reviews}.reverse
  end

  def winner
    sort_by_rating.first
  end
end
