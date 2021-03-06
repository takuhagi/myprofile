class ProfilesController < ApplicationController
  # リファクタリング（いったんコメントアウト中）
  # before_action :set_profile, except: [:index, :new, :create, :color, :pass]
  # before_action :set_user, except: [:index, :new, :create, :edit, :update]
  require "payjp"
  before_action :pay, only: [:index]
  before_action :correct_user, only: [:edit]
  before_action :logged_in_user, only: [:pass]

  def index
    if params[:q].present?
      @q = Profile.ransack(params[:q])
      @profiles = Profile.all.includes([:user])
      @user = User.all.includes([:profile])
      @rank_profiles = @profiles.order(pv_count: "DESC").limit(5)
      @new_profiles = @profiles.order(created_at: "DESC").limit(5)
      @profiles = @q.result.includes(:user).order(updated_at: :DESC).page(params[:page]).per(9)
    else
      params[:q] = { sorts: 'updated_at desc' }
      @q = Profile.ransack(params[:q])
      @profiles = Profile.all.includes([:user])
      @user = User.all.includes([:profile])
      @rank_profiles = @profiles.order(pv_count: "DESC").limit(5)
      @new_profiles = @profiles.order(created_at: "DESC").limit(5)
      @profiles = Profile.includes(:user).order(updated_at: :DESC).page(params[:page]).per(9)
    end

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

  def show
    @profile = Profile.find(params[:id])
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

  def inquiry
  end

  def select
    @profile = Profile.all.includes([:user])
  end

  def selectm
    @profile = Profile.all.includes([:user])
  end
  
  def selectb
    @profile = Profile.all.includes([:user])
  end

  def top
    @profile = Profile.all.includes([:user])
    @profiles = Profile.where(id: params[:profile][:top_ids]).includes([:user])
    if @profile.update(top0_params)
      @profiles.update(top_params)
      redirect_to selectm_profiles_path
    end
  end

  def middle
    @profile = Profile.all.includes([:user])
    @prof = Profile.where(id: params[:profile][:middle_ids]).includes([:user])
    if @profile.update(middle0_params)
      @prof.update(middle_params)
      redirect_to selectb_profiles_path
    end
  end

  def bottom
    @profile = Profile.all.includes([:user])
    @pr = Profile.where(id: params[:profile][:bottom_ids]).includes([:user])
    if @profile.update(bottom0_params)
      @pr.update(bottom_params)
      redirect_to root_path
    end
  end


  private
  
  def top_params
    params.permit(:top).merge(top: "1")
  end
  def middle_params
    params.permit(:middle).merge(middle: "1")
  end
  def bottom_params
    params.permit(:bottom).merge(bottom: "1")
  end

  def top0_params
    params.permit(:top).merge(top: "0")
  end
  def middle0_params
    params.permit(:middle).merge(middle: "0")
  end
  def bottom0_params
    params.permit(:bottom).merge(bottom: "0")
  end
  

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

  def pay
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    @card = Card.all
    subscription = Payjp::Subscription.all
    subscription.each do |s|
      if s.status == "paused"
        customer = Payjp::Customer.retrieve(s.customer)
        customer.delete
        @card.each do |card|
          if card.customer_id == customer.id
            card.delete
          end
        end
      end
    end
  end

  def correct_user
    @prof = Profile.find(params[:id])
    if @prof.user != current_user
      redirect_to root_path
    end
  end

  def logged_in_user
    unless user_signed_in?
      flash[:notice] = "ログインまたはアカウント登録をしてください"
      redirect_to root_path
    end
  end
  # リファクタリング（いったんコメントアウト中）
  # def set_profile
  #   @profile = Profile.find(params[:id])
  # end
  # def set_user
  #   @user = User.find(params[:profile_id])
  # end
  
end
