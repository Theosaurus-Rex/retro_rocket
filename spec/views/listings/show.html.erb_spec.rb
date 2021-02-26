require 'rails_helper'

RSpec.describe "listings/show", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      listing_title: "Listing Title",
      listing_description: "MyText",
      user: nil,
      price: "",
      condition: "Condition",
      category: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Listing Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Condition/)
    expect(rendered).to match(//)
  end
end
