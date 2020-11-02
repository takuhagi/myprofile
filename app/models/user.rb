class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  # validates :name, presence: true, uniqueness: true

  has_one :profile, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :comments, dependent: :destroy

  #1-3.2
  # attr_accessor :remember_token, ..., :reset_token
  #1-3.2
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end
  #1-3.3
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
end


