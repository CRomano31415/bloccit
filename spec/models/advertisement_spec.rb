require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advertisement) { Advertisement.create!(title: "New Ad Title", copy: "New Ad Copy", price: 17)}

  describe "attributes" do
    it "has title, copy and price attributes" do
      expect(advertisement).to have_attributes(title: "New Ad Title", copy: "New Ad Copy", price: 17)
    end
  end
end
