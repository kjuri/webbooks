admin = User.new(email: 'admin@example.com', password: 'adminadmin',
                 password_confirmation: 'adminadmin', first_name: 'Admin',
                 last_name: 'Admin', roles: 'admin')

admin.skip_confirmation!
admin.save
