class HomeController < ApplicationController

  require "payjp"
  before_action :pay, only: [:index]

  def index
    @profiles = Profile.all.includes([:user])
    @profilet = Profile.where(top: [1]).includes([:user])
    @profilem = Profile.where(middle: [1]).includes([:user])
    @profileb = Profile.where(bottom: [1]).includes([:user])
    @profile = Profile.where(bottom: [0]).includes([:user])
    @user = User.all.includes([:profile])
    @rank_profiles = @profiles.order(pv_count: "DESC").limit(5)
    @new_profiles = @profiles.order(created_at: "DESC").limit(5)
  end

  private

  def pay
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    @card = Card.all
    subscription = Payjp::Subscription.all
    subscription.each do |s|
      if s.status == "paused"
        customer = Payjp::Customer.retrieve(s.customer)
        customer.delete
        @card.each do |card|
          if card.customer_id == customer.id
            card.delete
          end
        end
      end
    end
  end
  
end
