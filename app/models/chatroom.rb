class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :farm
  has_many :messages
  has_many :users, through: :messages
end
