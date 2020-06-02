class List < ApplicationRecord
  belongs_to :shop
  has_many :likes, dependent: :destroy
end
