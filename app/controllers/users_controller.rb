class UsersController < ApplicationController

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

  def index
    @users = User.find(1)
    @profiles = Profile.find(1)

  end
end
