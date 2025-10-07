class Theme < ApplicationRecord
  has_many :landing_pages
  belongs_to :user, optional: true
  validates :name, :key, presence: true
end
