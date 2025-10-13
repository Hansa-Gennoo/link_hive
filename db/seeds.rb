# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

themes = [
  {
    name: "Modern White",
    key: "modern_white",
    font_heading: "Inter",
    font_body: "Inter",
    primary_colour: "#1A1A1A",
    accent_colour: "#2B7A78",
    background_colour: "#FFFFFF"
  },
  {
    name: "Pastel Serenity",
    key: "pastel_serenity",
    font_heading: "Playfair Display",
    font_body: "Lato",
    primary_colour: "#4C4C4C",
    accent_colour: "#A3B9C9",
    background_colour: "#F8F8F8"
  },
  {
    name: "Midnight Bold",
    key: "midnight_bold",
    font_heading: "Montserrat",
    font_body: "Open Sans",
    primary_colour: "#F4F4F4",
    accent_colour: "#FFB400",
    background_colour: "#121212"
  },
  {
    name: "Copper Elegance",
    key: "copper_elegance",
    font_heading: "Cormorant Garamond",
    font_body: "Lora",
    primary_colour: "#2B2B2B",
    accent_colour: "#B87333",
    background_colour: "#FFFFFF"
  },
  {
    name: "Forest Calm",
    key: "forest_calm",
    font_heading: "Poppins",
    font_body: "Open Sans",
    primary_colour: "#2E2E2E",
    accent_colour: "#4E8C6E",
    background_colour: "#F5F5F3"
  }
]

themes.each do |attrs|
  Theme.find_or_create_by!(key: attrs[:key]) do |theme|
    theme.update!(attrs)
  end
end

puts "✅ Seeded #{themes.size} themes with accent colours."
