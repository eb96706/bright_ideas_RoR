class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  validates :post, presence: true
end
