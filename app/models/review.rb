class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :product, :user, :description, :rating, presence: true
end
