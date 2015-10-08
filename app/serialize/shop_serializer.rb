class ShopSerializer < ActiveModel::Serializer
  attributes :id, :name, :category_id, :longitude,:latitude,:address,:homepage,:"image":{"url":"/uploads/shop/image/1/20151007164153.jpg","thumb":{"url":"/uploads/shop/image/1/thumb_20151007164153.jpg"}},"desc":"カフェ１です","created_at":"2015-10-07T16:41:53.761+09:00","updated_at":"2015-10-07T16:41:53.761+09:00"
