class Article < ApplicationRecord
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  validates :name, :description, presence: true, length: { minimum: 2 }
end
