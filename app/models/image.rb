class Image < ApplicationRecord
  belongs_to :profile

  mount_uploader :src, ImageUploader
end
