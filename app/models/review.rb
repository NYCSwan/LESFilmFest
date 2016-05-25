class Review < ActiveRecord::Base
  validates :title, :body, :star_value, :user_id, :film_id,  presence: true

  has_many :comments
  belongs_to :user
  belongs_to :film
end
