class Film < ActiveRecord::Base
  validates :title, :description, :writers, :actors, :director, :category_id, presence: true

  has_many :reviews
  belongs_to :category
  has_many :users, through: :reviews

def user_reviews
  user_reviews = self.reviews.select{|review| review.user.judge_status==false}
  review_sum = user_reviews.map{|review| review.star_value}.reduce(:+)
  user_average = review_sum / user_reviews.length
end

def judge_reviews
  judge_reviews = self.reviews.select{|review| review.user.judge_status==true}
  review_sum = judge_reviews.map{|review| review.star_value}.reduce(:+)
  judge_average = review_sum / judge_reviews.length
end

def total_reviews
  (self.judge_reviews * 0.8) + (self.user_reviews * 0.2)
end

end
