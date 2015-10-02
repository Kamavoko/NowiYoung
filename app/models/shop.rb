class Shop < ActiveRecord::Base
  # geocoded_by :address
  # after_validation :geocode
  belongs_to :category
  has_many :comments
  has_many :photos
#  has_many photo
  validates :name,
  presence: {message: "ショップ名は空欄に出来ませんコラコラコラコラ～ッ！(`o´)"}

  mount_uploader :image, ImageUploader

end
