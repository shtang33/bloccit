# == Schema Information
#
# Table name: summaries
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#

class Summary < ActiveRecord::Base
  belongs_to :post
end
