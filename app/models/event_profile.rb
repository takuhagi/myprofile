class EventProfile < ApplicationRecord
  has_many :event_images, dependent: :destroy
  belongs_to :user

  # fields_forメソッドを利用するため
  accepts_nested_attributes_for :event_images, allow_destroy: true
end
