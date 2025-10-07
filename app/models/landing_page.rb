class LandingPage < ApplicationRecord
  belongs_to :user
  belongs_to :theme, optional: true
  has_many :links, through: :user
end
