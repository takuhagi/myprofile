class Profile < ApplicationRecord
  # 先に中間テーブルとのアソシエーションを書くこと
  has_many :profile_tags, dependent: :destroy
  has_many :tags, through: :profile_tags, dependent: :destroy
  has_many :genres, through: :genre_profiles
  has_many :content
  has_many :images, dependent: :destroy
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
  # VR写真
  mount_uploader :sub_image, ImageUploader
  # 店舗写真
  mount_uploader :store_image, ImageUploader
  # 商品写真
  mount_uploader :item_image, ImageUploader
  # サービス写真
  mount_uploader :service_image, ImageUploader
  # イベント写真
  mount_uploader :event_image, ImageUploader
  # fields_forメソッドを利用するため
  accepts_nested_attributes_for :images, allow_destroy: true

  # ここからタグ関連
  # save_tagsクラスメソッド。引数には今回入力されたタグが入る
  def save_tags(saveprofile_tags)
    # Profileモデルにタグがない、ではなかったら、タグをtag_nameカラムで抽出して配列にし、変数current_tagsに代入
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    # current_tagsから今回入力されたタグを引いたものを変数old_tagsに代入
    old_tags = current_tags - saveprofile_tags
    # 今回入力されたタグからcurrent_tagsを引いたものを変数new_tagsに代入
    new_tags = saveprofile_tags - current_tags

    # old_tagsの中身を繰り返し処理。Tagモデルからold_nameに該当するものを抽出して削除。
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name: old_name)
    end
    # new_tagsの中身を繰り返し処理。Tagsモデルからnew_nameに該当するものがあれば抽出、なければ生成してtagsテーブルの最後尾に追加。
    new_tags.each do |new_name|
      profile_tag = Tag.find_or_create_by(tag_name: new_name)
      self.tags << profile_tag
    end
    
  end

  # gem bcrypt関連
  has_secure_password

end
