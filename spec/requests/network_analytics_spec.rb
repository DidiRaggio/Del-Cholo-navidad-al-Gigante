require 'rails_helper'

RSpec.describe "NetworkAnalytics", type: :request do
  describe "GET /network_analytics" do
    it "works! (now write some real specs)" do
      get network_analytics_path
      expect(response).to have_http_status(200)
    end
  end
end
