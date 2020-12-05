User.destroy_all

10.times do |i|
  User.create!(email: "user#{i}@email.com",
               password: "password",
               password_confirmation: "password")
end
