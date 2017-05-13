class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :shelf, inverse_of: :user
  accepts_nested_attributes_for :shelf
end
