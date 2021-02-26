require 'rails_helper'

RSpec.describe "listings/edit", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      listing_title: "MyString",
      listing_description: "MyText",
      user: nil,
      price: "",
      condition: "MyString",
      category: nil
    ))
  end

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(@listing), "post" do

      assert_select "input[name=?]", "listing[listing_title]"

      assert_select "textarea[name=?]", "listing[listing_description]"

      assert_select "input[name=?]", "listing[user_id]"

      assert_select "input[name=?]", "listing[price]"

      assert_select "input[name=?]", "listing[condition]"

      assert_select "input[name=?]", "listing[category_id]"
    end
  end
end
