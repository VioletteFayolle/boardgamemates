# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a default user
User.create!(email: 'user@user.com', password: 'password', username: 'user', first_name: 'User', last_name: 'User', birth_date: '1990-01-01', count: 0, rate: 0);
User.create!(email: 'owner@owner.com', password: 'password', username: 'owner', first_name: 'Owner', last_name: 'Owner', birth_date: '1990-01-01', count: 0, rate: 0);
