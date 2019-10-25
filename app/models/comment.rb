class Comment < ApplicationRecord
  validates_presence_of :body

  belongs_to :post
  belongs_to :user

  has_many :comment_tags, dependent: :destroy
  accepts_nested_attributes_for :comment_tags, allow_destroy: true

end
