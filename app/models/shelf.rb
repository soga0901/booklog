class Shelf < ApplicationRecord
  belongs_to :user
  has_many :books, through: :book_shelves
end
