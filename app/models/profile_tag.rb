class ProfileTag < ApplicationRecord
  belongs_to :profile
  belongs_to :tag
end
