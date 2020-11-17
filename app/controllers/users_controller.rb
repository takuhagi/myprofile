class UsersController < ApplicationController

  def index
    @user = User.find(params[:id])
    @profile = @user.profile
    @card = Card.find_by(user_id: current_user.id)
    @comment = Comment.new
    @comments = @user.comments.includes(:user).all.order("id DESC")
    @check = @comments.where(check: [nil])
    @reply_array = []
    @re_array = []
    @comments.each do |com|
      if com.reply_id != nil
        @reply_array << Comment.where(id: com.reply_id)
        
      end
    end
    @reply_array1 = @reply_array.flatten
    @reply_array2 = @reply_array1.uniq
    
    @comments.each do |com|
      if com.reply_id != nil
        @re_array << Comment.where(reply_id: com.reply_id)
        
      end
    end
    @re_array1 = @re_array.flatten
    @re_array2 = @re_array1.uniq
    @images = @profile.images
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    # パスワードが一致するか。 
    if @user.id == current_user.id || @profile.authenticate(params[:password])
      # 該当ユーザーのタグ名をpluckメソッドを使ってtag_nameカラムで取得。
      @tags = @profile.tags.pluck(:tag_name)
      
      # profileのtagを持ってくるように修正しました（もしかして@tagは使っていない？）
      # @tag = Tag.find(params[:id])
      @tag = @profile.tags
      
      # pvカウント
      if params[:pv_link] == "pv++" && @user.id != current_user.id
        @profile.pv_count += 1
        @profile.update(pv_count: @profile.pv_count)
        redirect_to user_path(@user.id)
      end
    else
      redirect_back(fallback_location: profile_pass_path(params[:id]))
      flash[:notice] = "パスワードが一致しませんでした。" 
    end
    # タグ全部取ってきます
    @tag_list = Tag.all

  end
  
  
  def edit
  end

  def create
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def search
    if params[:q].present?
      # 検索フォームからアクセスした時の処理
      @user_search = User.ransack(search_params)
      @users = @user_search.result(distinct: true).includes(:profile)
    else
      # 検索フォーム外からアクセスした時の処理
      params[:q] = { sorts: 'id desc' }
      @user_search = User.ransack()
      @users = User.all.includes(:profile)
    end

  end

  def vr
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end  

  def search_params
    params.require(:q).permit(:sorts, :nickname_or_profile_first_name_or_profile_family_name_or_profile_first_name_kana_or_profile_family_name_kana_cont, :profile_primary_school_or_profile_Junior_high_school_or_profile_high_school_or_profile_vocational_school_or_profile_university_or_profile_graduate_school_or_profile_other_school_cont, :profile_first_career_or_profile_second_career_or_profile_third_career_or_profile_fourth_career_or_profile_last_career_cont, :profile_tags_tag_name_cont, profile_tags_id_eq_any:[], tag_ids:[])
  end
  

end
