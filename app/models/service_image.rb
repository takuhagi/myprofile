class ServiceImage < ApplicationRecord
  belongs_to :service_profile
  mount_uploader :src, ImageUploader
end
