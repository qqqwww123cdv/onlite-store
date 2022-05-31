user = User.create!  :email => 'admin@mail.com', :password => 'topsecret', :password_confirmation => 'topsecret', role: :admin
user1 = User.create!  :email => 'test@mail.com', :password => 'password', :password_confirmation => 'password', role: :user

