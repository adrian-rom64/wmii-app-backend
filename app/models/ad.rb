class Ad < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :year, inclusion: { in: [0, 1, 2, 3, 4, 5]}, allow_blank: true
  validates :specialization, inclusion: { in: ['none', 'inf', 'mat']}, allow_blank: true
  belongs_to :user
  mount_uploader :background, ImageUploader
end
