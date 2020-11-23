class StoreProfile < ApplicationRecord
  has_many :store_images
  
  belongs_to :user

  # image_uploader
  mount_uploader :image, ImageUploader
end
