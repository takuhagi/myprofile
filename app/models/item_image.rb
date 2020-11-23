class ItemImage < ApplicationRecord
  belongs_to :item_profile
  mount_uploader :src, ImageUploader
end
