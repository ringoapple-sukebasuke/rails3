class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  mount_uploader :reservation.room_image, ImageUploader
end
