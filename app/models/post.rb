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
#

class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic
  has_one :summary
  accepts_nested_attributes_for :summary, :reject_if => lambda { |a| a[:body].blank? }, :allow_destroy => true

  # order all posts by their created_at date, in descending order.
  default_scope { order('created_at DESC') }

  # scope :ordered_by_title, -> {order('title ASC')}
  # scope :ordered_by_reverse_created_at, -> {order('created_at ASC')}

end
