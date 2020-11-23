class ServiceProfile < ApplicationRecord
  has_many :service_images

  belongs_to :user

  # image_uploader
  mount_uploader :image, ImageUploader
end
