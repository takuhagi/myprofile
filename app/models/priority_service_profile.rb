class PriorityServiceProfile < ApplicationRecord
  has_many :service_profiles

  validates :service_profile_id, uniqueness: true
  validates :priority_number, uniqueness: true
end
