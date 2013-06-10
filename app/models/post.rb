class Post < ActiveRecord::Base
  attr_accessible :content, :link, :title
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 140 }
  validates :link, presence: true
  default_scope order: 'posts.created_at DESC'
  self.per_page = 25
end
