class User < ApplicationRecord
has_many :rooms, dependent: :destroy

validates :name, {presence: true}  
validates :email, {presence: true, uniqueness: true}
has_secure_password
validates :password, presence: true, length: {minimum: 6}
mount_uploader :image, ImageUploader
end
