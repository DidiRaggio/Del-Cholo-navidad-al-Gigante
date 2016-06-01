require 'rails_helper'

RSpec.describe "network_analytics/edit", type: :view do
  before(:each) do
    @network_analytic = assign(:network_analytic, NetworkAnalytic.create!(
      :ad_source_connection_id => 1,
      :impressions => 1,
      :revenue => "9.99",
      :revenue_ecpm => 1.5,
      :bid => 1,
      :bid_rate => 1.5
    ))
  end

  it "renders the edit network_analytic form" do
    render

    assert_select "form[action=?][method=?]", network_analytic_path(@network_analytic), "post" do

      assert_select "input#network_analytic_ad_source_connection_id[name=?]", "network_analytic[ad_source_connection_id]"

      assert_select "input#network_analytic_impressions[name=?]", "network_analytic[impressions]"

      assert_select "input#network_analytic_revenue[name=?]", "network_analytic[revenue]"

      assert_select "input#network_analytic_revenue_ecpm[name=?]", "network_analytic[revenue_ecpm]"

      assert_select "input#network_analytic_bid[name=?]", "network_analytic[bid]"

      assert_select "input#network_analytic_bid_rate[name=?]", "network_analytic[bid_rate]"
    end
  end
end
