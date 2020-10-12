class UsersController < ApplicationController
  def index
    @users = User.find(1)
    @profiles = Profile.find(1)
  end

  def update
    @users = Profile.find(1)
    @users.update(profile_params)
  end

  private
  def profile_params
    params.require(:profile).permit(:color)
  end
end
