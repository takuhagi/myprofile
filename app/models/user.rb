class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # validates :name, presence: true, uniqueness: true
  validates_acceptance_of :agreement, allow_nil: false, on: :create
  has_one :profile, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :comments, dependent: :destroy

end
