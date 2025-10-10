class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :landing_page, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true


 
end
