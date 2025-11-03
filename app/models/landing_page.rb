class LandingPage < ApplicationRecord
  belongs_to :user
  belongs_to :theme, optional: true
  has_one_attached :avatar
  has_many :links, -> { order(position: :asc) }, dependent: :destroy
  accepts_nested_attributes_for :links

  # landing_pages table could have 'slug'
  #t.string :slug, null: false, unique: true
  after_initialize :set_default_theme, if: :new_record?

  def theme_name
    theme.name
  end

  private

  def set_default_theme
    self.theme ||= Theme.first # Pick first preset theme as default
  end


end
