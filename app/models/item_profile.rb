class ItemProfile < ApplicationRecord
  has_many :item_images

  belongs_to :user

  # image_uploader
  mount_uploader :image, ImageUploader
end
