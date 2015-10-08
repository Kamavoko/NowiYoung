class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :image, :desc, :shop_id, :user_id, :user_name,:created_at, :updated_at
  #  has_one :shop
  def user_name
    object.user.username
  end
end
