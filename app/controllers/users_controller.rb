class UsersController < ApplicationController

  def index
    @user = User.find(params[:id])
    @profile = @user.profile
    @comment = Comment.new
    @comments = @user.comments.includes(:user).all
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
    # binding.pry
    @images = @profile.images
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile

    # 該当ユーザーのタグ名をpluckメソッドを使ってtag_nameカラムで取得。
    @tags = @profile.tags.pluck(:tag_name)
    @tag = Tag.find(params[:id])

    @profile.pv_count += 1
    @profile.update(pv_count: @profile.pv_count)
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
    @user_search = User.ransack(params[:q])
    @users = @user_search.result
    @profile_search = Profile.ransack()
  end

  def vr
    @user = User.find(params[:user_id])
    @profile = @user.profile
    @images = @profile.images
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end  

  

end
