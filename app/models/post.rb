class Post < ApplicationRecord
  validates_presence_of :name, :url, :category_id, :body
  validates :url, uniqueness: true, on: :create

  belongs_to :category
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :post_types

  has_many :post_images, dependent: :destroy
  accepts_nested_attributes_for :post_images, allow_destroy: true

  has_many :comments, dependent: :destroy
  has_many :comment_tags, through: :comments, source: :comment_tags

  scope :is_active, -> {where(active: true)}
  scope :not_active, -> {where(active: false)}
end
