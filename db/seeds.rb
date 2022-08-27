raise 'Do not run in production!!!' if Rails.env == 'production'

conn = ActiveRecord::Base.connection
tables = conn.tables.reject { |t| t == 'schema_migrations' }
puts "Truncating all tables with:"
command = "TRUNCATE #{tables.join(',')} RESTART IDENTITY CASCADE"
puts command
conn.execute(command)

puts 'Creating admin user'
Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
