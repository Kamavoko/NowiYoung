class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :shop_id, :user_id, :created_at, :updated_at
  has_one :shop
  has_one :user
end
