
if Rails.env.development?
  admin = User.new(email: 'admin@example.com', password: 'adminadmin',
                   password_confirmation: 'adminadmin', first_name: 'Admin',
                   last_name: 'Admin', roles: 'admin')
else
  admin = User.new(email: 'admin@webbooks.com', password: 'adminwebbooks',
                   password_confirmation: 'adminwebbooks', first_name: 'Admin',
                   last_name: 'Admin', roles: 'admin')
end
admin.skip_confirmation!
admin.save
