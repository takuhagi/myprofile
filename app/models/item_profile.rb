class ItemProfile < ApplicationRecord
  has_many :item_images, dependent: :destroy
  belongs_to :user

  # fields_forメソッドを利用するため
  accepts_nested_attributes_for :item_images, allow_destroy: true
end
