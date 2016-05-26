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

def user_reviews_exist?
  true if self.reviews.select{|review| review.user.judge_status==false}.length > 0
end

def judge_reviews_exist?
  true if self.reviews.select{|review| review.user.judge_status==true}.length > 0
end

def total_reviews
  if judge_reviews_exist? && user_reviews_exist?
      (self.judge_reviews * 0.8) + (self.user_reviews * 0.2)
  elsif user_reviews_exist?
    self.user_reviews
  elsif judge_reviews_exist?
    self.judge_reviews
  else
    0
  end
end

def round_to_fifth
  ((self.total_reviews) * 2).round / 2.0
end

end
