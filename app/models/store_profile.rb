class StoreProfile < ApplicationRecord
  has_many :store_images
  
  belongs_to :user
end
