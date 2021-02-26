require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    assign(:listings, [
      Listing.create!(
        listing_title: "Listing Title",
        listing_description: "MyText",
        user: nil,
        price: "",
        condition: "Condition",
        category: nil
      ),
      Listing.create!(
        listing_title: "Listing Title",
        listing_description: "MyText",
        user: nil,
        price: "",
        condition: "Condition",
        category: nil
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", text: "Listing Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "Condition".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
