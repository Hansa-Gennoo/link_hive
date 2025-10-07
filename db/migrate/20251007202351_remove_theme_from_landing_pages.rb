class RemoveThemeFromLandingPages < ActiveRecord::Migration[7.1]
  def change
    remove_column :landing_pages, :theme, :string
  end
end
