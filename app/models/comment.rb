class Comment < ApplicationRecord
  belongs_to :shelf
  belongs_to :user
end
