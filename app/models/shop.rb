class Shop < ActiveRecord::Base
  # geocoded_by :address
  # after_validation :geocode
  belongs_to :category
#  has_many photo
  validates :name,
  presence: {message: "コラコラコラコラ～ッ！(`o´)"}

  mount_uploader :image, ImageUploader

end
