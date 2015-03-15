class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  # order all posts by their created_at date, in descending order.
  default_scope { order('created_at DESC') } #
end
