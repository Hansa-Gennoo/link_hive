class LandingPage < ApplicationRecord
  belongs_to :user
  belongs_to :theme, optional: true
  has_many :links, dependent: :destroy

  extend FriendlyId
  friendly_id :username, use: :slugged
end
