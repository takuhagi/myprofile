class EventImage < ApplicationRecord
  belongs_to :event_profile
  mount_uploader :src, ImageUploader
end
