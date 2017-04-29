class Course < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :sections

  validates :title, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}
end
