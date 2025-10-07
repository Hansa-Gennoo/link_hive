class CreateThemes < ActiveRecord::Migration[7.1]
  def change
    create_table :themes do |t|
      t.string :name
      t.string :key
      t.boolean :base
      t.string :primary_colour
      t.string :accent_colour
      t.string :background_colour
      t.string :font_heading
      t.string :font_body
      t.boolean :customisable

      t.timestamps
    end
    add_index :themes, :key
  end
end
