class Ad < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :year, inclusion: { in: [1,2,3,4]}
  belongs_to :user
  mount_uploader :background, ImageUploader
end
