class AddTitleToLandingPages < ActiveRecord::Migration[7.1]
  def change
    add_column :landing_pages, :title, :string
  end
end
