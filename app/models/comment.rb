class Comment < ActiveRecord::Base
  belongs_to :shop
  validates :text, presence: true
end
