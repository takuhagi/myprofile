class ProfilesController < ApplicationController
  # リファクタリング（いったんコメントアウト中）
  # before_action :set_profile, except: [:index, :new, :create, :color, :pass]
  # before_action :set_user, except: [:index, :new, :create, :edit, :update]

  def index
    @profiles = Profile.all
    @user = User.all
    @rank_profiles = @profiles.order(pv_count: "DESC").limit(5)
    @new_profiles = @profiles.order(created_at: "DESC").limit(5)
  end

  def new
    @profile = Profile.new
    @profile.images.new
  end

  def create
    @user = User.find(current_user.id)
    @profile = Profile.new(profile_params)
    @profile[:color] = "background: rgb(255, 255, 255)"  #デフォルト背景色
    # profilesテーブルのタグを抽出してカンマ区切りする
    tag_list = params[:profile][:tag_ids].split(',')
    @profile.pv_count = 0
    if @profile.save
      # メール送信
      # ContactMailer.send_when_signup(@user).deliver
      @profile.save_tags(tag_list)
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
    # すでに存在しているタグをtag_nameカラムで抽出して配列にし、カンマ区切りで結合
    @tag_list = @profile.tags.pluck(:tag_name).join(",")
  end


  def update

    @profile = Profile.find(params[:id])
    tag_list = params[:profile][:tag_ids].split(',')
    if @profile.update(profile_params)
      @profile.save_tags(tag_list)
      # 詳細画面へリダイレクト
      # redirect_to profile_path(params[:id])
      redirect_to root_path
    else
      render "profiles/edit"
    end

  end

  def color
    @user = User.find(params[:profile_id])
    @profile = @user.profile
    if @profile.update(profile_params)
      redirect_to users_path(id: current_user.id)
    else
      render root_path
    end

  end

  def pass
    @user = User.find(params[:profile_id])
    if @user.id == current_user.id
      redirect_to user_path(current_user.id)
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
      :store_name,
      :store_explanation,
      :store_image,
      :item_name,
      :item_explanation,
      :item_image,
      :service_name,
      :service_explanation,
      :service_image,
      :event_name,
      :event_explanation,
      :event_image,
      :event_place,
      :event_start,
      :event_end,
      :remove_store_image,
      :remove_item_image,
      :remove_service_image,
      :remove_event_image,

      :sub_image,            # VR画像
      :catch_copy,           # キャッチコピー
      :avatar_title,         # アバター写真のタイトル
      :avatar_catch_copy,    # アバター写真のキャッチコピー
      :avatar_about,         # アバター写真の説明文
      :remove_image,
      :remove_sub_image,
      :remove_avatar,
      :password,
      :password_confirmation,

      images_attributes: [:src, :_destroy, :id]
    ).merge(user_id: current_user.id)
  end

  # リファクタリング（いったんコメントアウト中）
  # def set_profile
  #   @profile = Profile.find(params[:id])
  # end
  # def set_user
  #   @user = User.find(params[:profile_id])
  # end
  
end
