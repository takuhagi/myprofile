require 'mail'

mail = Mail.new do
  from    'h.takumi52@gmail.com'
  to      's80.hagiwara.takumi@gmail.com'
  subject 'Mail from Mail'
  body    'There is a body.'
end

mail.delivery_method :smtp, { address:   'smtp.gmail.com',
  port:      587,
  domain:    'gmail.com',
  user_name: 's80.hagiwara.takumi@gmail.com',
  password:  'takumi523197'}

  mail.deliver!