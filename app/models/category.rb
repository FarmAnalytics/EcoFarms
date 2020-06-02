class Category < ApplicationRecord
  has_many :criterions, dependent: :destroy
end
