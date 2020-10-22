class UsersController < ApplicationController

  def index
    @user = User.find(params[:id])
    @profile = @user.profile
    @comment = Comment.new
    @comments = @user.comments.includes(:user).all
    @check = @comments.where(check: [nil])
    # binding.pry
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

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end  

  

end
