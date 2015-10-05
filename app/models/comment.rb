class Comment < ActiveRecord::Base
  belongs_to :shop
  belongs_to :user
  validates :text, presence: true
end
