class UsersController < ApplicationController

  def index
    @user = User.find(params[:id])
    @profile = @user.profile

  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    # 該当ユーザーのタグ名をpluckメソッドを使ってtag_nameカラムで取得。
    @tags = @profile.tags.pluck(:tag_name)
    @tag = Tag.find(params[:id])
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
