require 'rails_helper'

RSpec.describe "nadaserves/index", type: :view do
  before(:each) do
    assign(:nadaserves, [
      Nadaserve.create!(
        :ad_source_connection_id => 1,
        :impressions => 2,
        :revenue => "9.99",
        :revenue_ecpm => 1.5,
        :bid => 3,
        :bid_rate => 1.5
      ),
      Nadaserve.create!(
        :ad_source_connection_id => 1,
        :impressions => 2,
        :revenue => "9.99",
        :revenue_ecpm => 1.5,
        :bid => 3,
        :bid_rate => 1.5
      )
    ])
  end

  it "renders a list of nadaserves" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
