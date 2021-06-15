class Article < ApplicationRecord
  belongs_to :user
  validates :name, :description, presence: true, length: { minimum: 2 }
end
