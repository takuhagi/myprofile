class CardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def index
    if @card.blank?
      redirect_to action: "new" 
    else
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @credit_card = customer.cards.retrieve(@card.credit_card_id)
    end
  end

  def new
    if @card.blank?
      @credit_card = Card.new
    else
      redirect_to action: "index"
    end
  end

  def create
    customer = Payjp::Customer.create(card: params[:payjpToken])
    @credit_card = Card.new(user_id: current_user.id, customer_id: customer.id, credit_card_id: customer.default_card)
    if @credit_card.save
      Payjp::Subscription.create(
        plan: plan,
        prorate: true,
        customer: @credit_card.customer_id
      )
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end
  end

  def destroy
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    @card.delete
    if @card.destroy
      redirect_to root_path, notice: "有料会員を退会しました" 
    else
      redirect_to action: "index", notice: "退会処理に失敗しました" 
    end
  end
  
  def set_card
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    @card = Card.find_by(user_id: current_user.id)
  end

  def plan
    Payjp::Plan.create(
      amount: 1000,
      currency: 'jpy',
      interval: 'month',
      billing_day: '1',
    )
  end
  
end
