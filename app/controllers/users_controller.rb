class UsersController < ApplicationController
  def index
    @users = User.find(1)
    @profiles = Profile.find(1)
  end
end
