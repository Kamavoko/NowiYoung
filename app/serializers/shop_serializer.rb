class ShopSerializer < ActiveModel::Serializer
  attributes :id, :name, :category_id, :longitude,:latitude,:address,:homepage,:image, :desc, :created_at, :updated_at
  has_one :category
  # コメントと写真は1対n
  has_many :comments
  has_many :photos
  # タグとはn対n
  #has_many :shop_tags
  has_many :tags, :through => :shop_tags

end
