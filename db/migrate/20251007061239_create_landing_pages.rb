class CreateLandingPages < ActiveRecord::Migration[7.1]
  def change
    create_table :landing_pages do |t|
      t.references :user, null: false, foreign_key: true
      t.string :username
      t.text :bio
      t.string :theme

      t.timestamps
    end
    add_index :landing_pages, :username, unique: true
  end
end
