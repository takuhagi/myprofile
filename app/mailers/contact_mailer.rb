class ContactMailer < ApplicationMailer
  def send_when_signup(user)
    @user = user
    
    mail to: user.email, subject: '【サイト名】 '
  end

  def send_when_comment(user)
    @user = user
    
    mail to: user.email, subject: '【サイト名】 '
  end
end
