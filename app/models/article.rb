class Article < ApplicationRecord
  validates :name, :description, presence: true, length: { minimum: 2 }
end