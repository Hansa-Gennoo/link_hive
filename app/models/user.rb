class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :landing_page
  has_many :links, dependent: :destroy

  validates :email, presence: true
  validates :password, presence: true
end
