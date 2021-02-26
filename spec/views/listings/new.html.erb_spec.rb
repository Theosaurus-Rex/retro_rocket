require 'rails_helper'

RSpec.describe "listings/new", type: :view do
  before(:each) do
    assign(:listing, Listing.new(
      listing_title: "MyString",
      listing_description: "MyText",
      user: nil,
      price: "",
      condition: "MyString",
      category: nil
    ))
  end

  it "renders new listing form" do
    render

    assert_select "form[action=?][method=?]", listings_path, "post" do

      assert_select "input[name=?]", "listing[listing_title]"

      assert_select "textarea[name=?]", "listing[listing_description]"

      assert_select "input[name=?]", "listing[user_id]"

      assert_select "input[name=?]", "listing[price]"

      assert_select "input[name=?]", "listing[condition]"

      assert_select "input[name=?]", "listing[category_id]"
    end
  end
end
