class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # app/models/user.rb
  after_create :create_default_landing_page

  def create_default_landing_page
    default_theme = Theme.first
    self.landing_pages.create!(title: "My Landing Page", theme: default_theme)
  end

  extend FriendlyId
  friendly_id :username, use: :slugged

  has_one :landing_page, dependent: :destroy

  def should_generate_new_friendly_id?
    slug.blank? || will_save_change_to_username?
  end

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true



end
