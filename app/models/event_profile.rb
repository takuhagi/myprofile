class EventProfile < ApplicationRecord
  has_many :event_images

  belongs_to :user

  # image_uploader
  mount_uploader :image, ImageUploader
end
