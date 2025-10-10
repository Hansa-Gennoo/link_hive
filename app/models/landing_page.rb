class LandingPage < ApplicationRecord
  belongs_to :user
  belongs_to :theme, optional: true
  has_many :links, dependent: :destroy


  # landing_pages table could have 'slug'
  #t.string :slug, null: false, unique: true
  after_initialize :set_default_theme, if: :new_record?

  private

  def set_default_theme
    self.theme ||= Theme.first # Pick first preset theme as default
  end
end

