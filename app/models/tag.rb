class Tag < ApplicationRecord
  # 先に中間テーブルとのアソシエーションを書くこと
  has_many :profile_tags, dependent: :destroy
  has_many :profiles, through: :profile_tags, dependent: :destroy
end
