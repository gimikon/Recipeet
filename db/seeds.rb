User.destroy_all
u1 = User.create :email => 'yukiko@gmail.com', :name => 'Yukiko Isogimi', :password => 'chicken'
u2 = User.create :email => 'yukiko@outlook.com', :name => 'Akiko Tominaga', :password => 'chicken'
u3 = User.create :email => 'yukikosan@gmail.com', :name => 'Azusa Ito', :password => 'chicken'
puts "#{User.count} users created"

Post.destroy_all

p1 = Post.create :title => 'Curry', :content => "I made japanese curry tonight", :image => "https://img-global.cpcdn.com/recipes/565cd0f552e847e9/1280x1280sq70/photo.jpg"

p2 = Post.create :title => "Cookies", :content => "I am going to make cookies today", :image => "https://img-global.cpcdn.com/recipes/19cf37bb1fbc43b2/1280x1280sq70/photo.jpg"

p3 = Post.create :title => "Tomato Past", :content => "I made Special tomato pasta today, please check it out", :image => "https://img-global.cpcdn.com/recipes/416c32f67bb6e167/1280x1280sq70/photo.jpg"

puts "#{ Post.count } posts created"

# users and posts
u1.posts << p1 << p2
u2.posts << p2
u3.posts << p3

users = User.all
user  = users.first
following = users.take(2)
followers = users.take(5).drop(2)
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

users = User.order(:created_at).take(3)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.woofs.create!(status: content) }
end
