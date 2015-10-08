class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :shop_id, :user_id, :user_name, :created_at, :updated_at
  def user_name
    object.user.username
  end
end
