class Link < ApplicationRecord
  belongs_to :landing_page
  acts_as_list scope: :landing_page #for ordering

  validates :title, :url, presence: true

end
