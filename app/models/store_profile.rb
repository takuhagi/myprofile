class StoreProfile < ApplicationRecord
  has_many :store_images, dependent: :destroy
  belongs_to :user
  belongs_to :priority_store_profile

  # image_uploader
  mount_uploader :image, ImageUploader
  # fields_forメソッドを利用するため
  accepts_nested_attributes_for :store_images, allow_destroy: true
end
