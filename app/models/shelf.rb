class Shelf < ApplicationRecord
  belongs_to :user
  has_many  :reviews
  has_many :books, through: :book_shelves
  has_many :book_shelves
end
