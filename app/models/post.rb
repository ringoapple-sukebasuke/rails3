class Post < ApplicationRecord
  validates :room_name, {presence: true}  
  validates :room_introduction, {presence: true}
  validates :room_price, {presence: true}
  validates :room_address, {presence: true}
  validates :room_image, {presence: true}
  mount_uploader :image, ImageUploader
end
