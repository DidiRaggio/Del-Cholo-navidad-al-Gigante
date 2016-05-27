require 'rails_helper'

RSpec.describe "nadaserves/show", type: :view do
  before(:each) do
    @nadaserve = assign(:nadaserve, Nadaserve.create!(
      :ad_source_connection_id => 1,
      :impressions => 2,
      :revenue => "9.99",
      :revenue_ecpm => 1.5,
      :bid => 3,
      :bid_rate => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/1.5/)
  end
end
