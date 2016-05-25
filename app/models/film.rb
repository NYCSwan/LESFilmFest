class Film < ActiveRecord::Base
  validates :title, :description, :writers, :actors, :director, :category_id, presence: true

  has_many :reviews
  belongs_to :category
  has_many :users, through: :reviews
end
