class Profile < ApplicationRecord
 has_many :tags, through: :profile_tags
 has_many :genres, through: :genre_profiles
 has_many :content
 belongs_to :user
end
