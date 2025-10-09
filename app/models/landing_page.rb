class LandingPage < ApplicationRecord
  belongs_to :user
  belongs_to :theme, optional: true
  has_many :links, dependent: :destroy


  # landing_pages table could have 'slug'
  t.string :slug, null: false, unique: true
end
