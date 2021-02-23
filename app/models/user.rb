class User < ApplicationRecord
  validates :username, uniqueness: true
  validates :username, presence: true
  has_many :attendances
  has_many :events, through: :attendances
end
