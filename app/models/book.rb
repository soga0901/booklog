class Book < ApplicationRecord
  has_many :shelves, through: :book_shelves
end
