require 'random_data'

5.times do
    User.create!(
      name:     RandomData.random_name,
      email:    RandomData.random_email,
      password: RandomData.random_sentence
    )
end

users = User.all

15.times do
  Topic.create!(
    name:   RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end

topics = Topic.all

50.times do
  post = Post.create!(
    user:   users.sample,
    topic:  topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )


  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)

  rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }

end

posts = Post.all


10.times do
  SponsoredPost.create!(
    topic: topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    price:  RandomData.random_price
  )
end

sponsored_posts = SponsoredPost.all

20.times do
  Advertisement.create!(
    title:  RandomData.random_sentence,
    copy:   RandomData.random_paragraph,
    price:  RandomData.random_price
  )
end

advertisements = Advertisement.all

20.times do
  Question.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    resolved:  RandomData.random_boolean
  )
end

questions = Question.all


100.times do
    Comment.create!(
      user: users.sample,
      post: posts.sample,
      body: RandomData.random_paragraph
    )
end

# Create an admin user
 admin = User.create!(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )

 # Create a member
 member = User.create!(
   name:     'Member User',
   email:    'cipeinado@gmail.com',
   password: 'helloworld'
 )

# uniqPost = Post.find_or_create_by!(title: 'Greeting', body: 'Hi there!')
# Comment.find_or_create_by!(post: uniqPost, body: 'The most unique body!')

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} ads created"
puts "#{Vote.count} votes created"
puts "#{Question.count} questions created"
puts "#{SponsoredPost.count} sponsored Posts created"
