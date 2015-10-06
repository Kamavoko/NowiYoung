class ShopTag < ActiveRecord::Base
  belongs_to :shop
  belongs_to :tag
end
