class EventProfile < ApplicationRecord
  has_many :event_images

  belongs_to :user
end
