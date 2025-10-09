class Link < ApplicationRecord
  belongs_to :landing_page

  validates :title, :url, presence: true

  before_create :set_default_position

  private

  def set_default_position
    if position.nil?
      max_position = landing_page.links.maximum(:position) || 0
      self.position = max_position + 1
    end
  end
end
