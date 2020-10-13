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
      redirect_to root_path
    else
      # flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    # profiles/:id/edit
    # binding.pry
    @profile = Profile.find(params[:id])
  end


  def update

    @profiles = Profile.find(current_user.id)
    @profiles.update(profile_params)

    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      # 詳細画面へリダイレクト
      # redirect_to profile_path(params[:id])
      redirect_to root_path
    else
      render "profiles/edit"
    end

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

      :color,

      :sub_image,            # サブ写真
      :catch_copy,           # キャッチコピー
      :avatar_title,         # アバター写真のタイトル
      :avatar_catch_copy,    # アバター写真のキャッチコピー
      :avatar_about          # アバター写真の説明文

    ).merge(user_id: current_user.id)
  end
  
end
