class PriorityItemProfile < ApplicationRecord
  has_many :item_profiles

  validates :item_profile_id, uniqueness: true
  validates :priority_number, uniqueness: true
end
