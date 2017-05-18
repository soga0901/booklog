class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :shelf
  has_many :reviews
  accepts_nested_attributes_for :shelf
end
