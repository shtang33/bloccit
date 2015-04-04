# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  topic_id   :integer
#  image      :string
#

class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :topic

  # order all posts by their created_at date, in descending order.
  default_scope { order('created_at DESC') }

  # scope :ordered_by_title, -> {order('title ASC')}
  # scope :ordered_by_reverse_created_at, -> {order('created_at ASC')}

  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  validates :topic, presence: true
  validates :user, presence: true

end
