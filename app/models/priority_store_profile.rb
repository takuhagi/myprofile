class PriorityStoreProfile < ApplicationRecord
  has_many :store_profiles

  validates :store_profile_id, uniqueness: true
  validates :priority_number, uniqueness: true
end
