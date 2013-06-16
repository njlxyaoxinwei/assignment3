class Vote < ActiveRecord::Base
  attr_accessible #:user_id, :post_id, :up
  belongs_to :user  
  belongs_to :post
  validates :user_id, presence: true, :uniqueness => {:scope => :post_id} #The way to set up uniqueness across two fields
  validates :post_id, presence: true
  #validates :up, presence: true //This won't work because :up could be false.
  validates_inclusion_of :up, :in => [true, false]
  default_scope order: 'votes.created_at DESC'
end
