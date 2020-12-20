class HomeController < ApplicationController
  def index
    @profiles = Profile.all.includes([:user])
    @profilet = Profile.where(top: [1]).includes([:user])
    @profilem = Profile.where(middle: [1]).includes([:user])
    @profileb = Profile.where(bottom: [1]).includes([:user])
    @user = User.all.includes([:profile])
    @rank_profiles = @profiles.order(pv_count: "DESC").limit(5)
    @new_profiles = @profiles.order(created_at: "DESC").limit(5)
  end
end
