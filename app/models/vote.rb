class Vote < ActiveRecord::Base
  attr_accessible #:user_id, :post_id, :up
  belongs_to :user  
  belongs_to :post
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :up, presence: true
  default_scope order: 'votes.created_at DESC'
end
