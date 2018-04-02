require 'random_data'

15.times do
  Topic.create!(
    name:   RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

50.times do
  Post.create!(
    topic:  topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
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
      post: posts.sample,
      body: RandomData.random_paragraph
    )
end

# uniqPost = Post.find_or_create_by!(title: 'Greeting', body: 'Hi there!')
# Comment.find_or_create_by!(post: uniqPost, body: 'The most unique body!')

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} ads created"
puts "#{Question.count} questions created"
puts "#{SponsoredPost.count} sponsored Posts created"
