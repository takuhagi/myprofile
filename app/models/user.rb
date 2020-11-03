class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  # validates :name, presence: true, uniqueness: true

  has_one :profile, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :comments, dependent: :destroy

end
