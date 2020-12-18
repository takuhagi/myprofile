class PriorityEventProfile < ApplicationRecord
  has_many :event_profiles

  validates :event_profile_id, uniqueness: true
  validates :priority_number, uniqueness: true
end
