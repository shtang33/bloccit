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
#  rank       :float
#

class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :topic
  has_many :votes, dependent: :destroy

  # order all posts by their created_at date, in descending order.
  default_scope { order('rank DESC') }

  # scope :ordered_by_title, -> {order('title ASC')}
  # scope :ordered_by_reverse_created_at, -> {order('created_at ASC')}

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: 1).count
  end

  def points
    (self.up_votes) + (self.down_votes)
  end

  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
    new_rank = points + age_in_days

    update_attribute(:rank, new_rank)
  end


  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  # validates :topic, presence: true
  # validates :user, presence: true

end
