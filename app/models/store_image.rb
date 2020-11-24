class StoreImage < ApplicationRecord
  belongs_to :store_profile
  mount_uploader :src, ImageUploader
end
