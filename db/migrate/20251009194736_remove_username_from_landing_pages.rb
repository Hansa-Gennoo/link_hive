class RemoveUsernameFromLandingPages < ActiveRecord::Migration[7.1]
  def change
    remove_column :landing_pages, :username, :string
  end
end
