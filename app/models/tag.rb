class Tag < ApplicationRecord
  has_many :profile, through: :profile_tags
end
