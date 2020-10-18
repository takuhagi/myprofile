class UsersController < ApplicationController

  def index
    @user = User.find(params[:id])
    @profile = @user.profile

  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
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

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end  

  

end
