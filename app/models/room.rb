class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :user_id, {presence: true}
end
