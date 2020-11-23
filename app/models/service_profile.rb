class ServiceProfile < ApplicationRecord
  has_many :service_images

  belongs_to :user
end
