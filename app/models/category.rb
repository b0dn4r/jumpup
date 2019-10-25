class Category < ApplicationRecord
  validates_presence_of :name, :url
  validates :url, uniqueness: true, on: :create

  has_many :posts

  scope :is_active, -> {where(active: true)}
  scope :not_active, -> {where(active: false)}

  has_attached_file :img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
end
