class Shop < ActiveRecord::Base
  # Google Map
  geocoded_by :address
  after_validation :geocode
  # カテゴリーとはn対1
  belongs_to :category
  # コメントと写真は1対n
  has_many :comments
  has_many :photos
  # 入力規制
  validates :name,
  presence: {message: "ショップ名は空欄に出来ません"}
  # 画像投稿
  mount_uploader :image, ImageUploader
end
