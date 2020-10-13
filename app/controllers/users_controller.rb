class UsersController < ApplicationController

  def index
    @users = User.find(current_user.id) #あとで変更
    @profiles = @users.profile

  end

  def show
    @user = User.find(1)
    @profile = @user.profile
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
