require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
#for the topic
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }

# for the sponsored_post
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
  let(:price) { 17 }
  # let(:price) { RandomData.random_price } --> will return error 

  let(:topic) { Topic.create!(name: name, description: description) }

  let(:sponsored_post) { topic.sponsored_posts.create!(title: title, body: body, price: price) }

  it { is_expected.to belong_to(:topic) }

 describe "attributes" do
   it "has title and body attributes" do
     expect(sponsored_post).to have_attributes(title: title, body: body, price: price)
   end
 end
end
