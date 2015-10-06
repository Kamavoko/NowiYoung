class Tag < ActiveRecord::Base
  # ショップとはn対n
  has_many :shop_tags
  has_many :shop, :through => :shop_tags
end
