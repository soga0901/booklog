class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  belongs_to :shelf
  belongs_to :status
end
