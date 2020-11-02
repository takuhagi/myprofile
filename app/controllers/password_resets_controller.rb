class PasswordResetsController < ApplicationController
  def new
  end

  def edit
  end

  #1-3.1
  class PasswordResetsContoroller < ApplicationController
    .
    .
    .
    def create
      @user = User.find_by(email: params[:password_reset][:email].downcase)
      if @user
        @user.create_reset_digest  #2で定義
        @user.send_password_reset_email  #3で定義
        flash[:info] = "パスワード再設定リンク付きのメールを送信しました"
        redirect_to root_url
      else
        flash.now[:danger] = "メールアドレスが不正です"
        render 'new'
      end
    end
    .
    .
    .
  end



end

