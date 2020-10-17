class Profile < ApplicationRecord
  # 先に中間テーブルとのアソシエーションを書くこと
  has_many :profile_tags, dependent: :destroy
  has_many :tags, through: :profile_tags, dependent: :destroy
  has_many :genres, through: :genre_profiles
  has_many :content
  belongs_to :user
#  アクティブハッシュ（都道府県）
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

#  バリデーション
  validates :first_name, presence: true, length: {maximum: 10}
  validates :family_name, presence: true, length: {maximum: 10}
  validates :first_name_kana, presence: true, length: {maximum: 20}
  validates :family_name_kana, presence: true, length: {maximum: 20}
  validates :city, presence: true, length: {maximum: 20}
  validates :post_code, presence: true, length: {maximum: 7}
  validates :address_number, presence: true, length: {maximum: 40}
  validates :building, length: {maximum: 40}
  validates :primary_school, length: {maximum: 20}
  validates :Junior_high_school, length: {maximum: 20}
  validates :high_school, length: {maximum: 20}
  validates :vocational_school, length: {maximum: 40}
  validates :university, length: {maximum: 40}
  validates :graduate_school, length: {maximum: 40}
  validates :other_school, length: {maximum: 40}
  validates :first_career, length: {maximum: 40}
  validates :second_career, length: {maximum: 40}
  validates :third_career, length: {maximum: 40}
  validates :fourth_career, length: {maximum: 40}
  validates :last_career, length: {maximum: 40}
  validates :introduction, length: {maximum: 500}
  validates :birth_date, presence: true
  validates :phone, length: {maximum: 11}
  validates :hp, length: {maximum: 60}
  validates :facebook, length: {maximum: 60}
  validates :twitter, length: {maximum: 60}
  validates :catch_copy, length: {maximum: 60}
  validates :avatar_title, length: {maximum: 40}
  validates :avatar_about, length: {maximum: 500}

  # image_uploader
  # アバター写真
  mount_uploader :avatar, ImageUploader
  # メイン写真
  mount_uploader :image, ImageUploader
  # メイン写真
  mount_uploader :sub_image, ImageUploader

  def save_tags(saveprofile_tags)
    # saveprofile_tags.each do |new_name|
    #   profile_tag = Tag.find_or_create_by(tag_name: new_name)
    #   self.tags << profile_tag
    # end
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - saveprofile_tags
    new_tags = saveprofile_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name: old_name)
    end

    new_tags.each do |new_name|
      profile_tag = Tag.find_or_create_by(tag_name: new_name)
      self.tags << profile_tag
    end
    
  end


end
