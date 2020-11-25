class ServiceProfile < ApplicationRecord
  has_many :service_images, dependent: :destroy
  belongs_to :user

  # fields_forメソッドを利用するため
  accepts_nested_attributes_for :service_images, allow_destroy: true
end
