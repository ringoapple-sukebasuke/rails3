class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :user_id, {presence: true}
  mount_uploader :room_image, ImageUploader

  
  def Room.search_area(search_area)
    Room.where(['room_address LIKE ?', "%#{search_area}%"])
  end

  def Room.search_keyword(search_keyword)
    Room.where(['room_name LIKE ? OR room_introduction LIKE ? OR room_address LIKE ?',
                "%#{search_keyword}%", "%#{search_keyword}%", "%#{search_keyword}%"])
  end

end
