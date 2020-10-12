class ProfilesController < ApplicationController

  def index
  
  end

  def new
    @profile = Profile.new
  end
  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      # flash[:success] = "Profile successfully created"
      redirect_to @profile
    else
      # flash[:error] = "Something went wrong"
      render 'new'
    end
  end


  def update
    @profiles = Profile.find(1)
    @profiles.update(profile_params)
  end

  private

  def profile_params
    params.require(:profile).permit(
      :first_name,           # 名字
      :family_name,          # 名前
      :first_name_kana,      # 名字かな
      :family_name_kana,     # 名前かな
      :post_code,            # 郵便番号
      :prefecture_id,        # 都道府県
      :city,                 # 市区町村
      :address_number,       # 以降の住所
      :building,             # 建物名
      :primary_school,       # 小学校
      :Junior_high_school,   # 中学校
      :high_school,          # 高校
      :vocational_school,    # 専門学校
      :university,           # 大学
      :graduate_school,      # 大学院
      :other_school,         # その他の学歴
      :first_career,         # 職歴１
      :second_career,        # 職歴２
      :third_career,         # 職歴３
      :fourth_career,        # 職歴４
      :last_career,          # 職歴５
      :introduction,         # 紹介文
      :birth_date,           # 生年月日
      :avatar,               # アバター写真
      :phone,                # 電話番号
      :image,                # 写真※どこのか？
      :hp,                   # HP
      :facebook,             # Facebook
      :twitter,              # Twitter
      :color
    ).merge(user_id: current_user.id)
  end
  
end
