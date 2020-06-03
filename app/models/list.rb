class List < ApplicationRecord
  belongs_to :shop
  has_many :likes, dependent: :destroy
  has_many :farms, through: :likes
end
