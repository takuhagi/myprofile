class Genre < ApplicationRecord
  has_many :profiles, through: :genre_profiles
end
