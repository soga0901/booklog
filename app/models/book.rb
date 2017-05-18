class Book < ApplicationRecord
  has_many :shelves, through: :book_shelves
  has_many :book_shelves
  has_many :reviews
end
