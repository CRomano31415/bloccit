require 'random_data'

50.times do
  Post.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

100.times do
    Comment.create!(
      post: posts.sample,
      body: RandomData.random_paragraph
    )
end

uniqPost = Post.find_or_create_by!(title: 'Greeting', body: 'Hi there!')
Comment.find_or_create_by!(post: uniqPost, body: 'The most unique body!')

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
