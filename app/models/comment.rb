# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  belongs_to :post
  validates :content, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true
  default_scope order: 'comments.created_at'
  self.per_page = 25
end
