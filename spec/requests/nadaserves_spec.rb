require 'rails_helper'

RSpec.describe "Nadaserves", type: :request do
  describe "GET /nadaserves" do
    it "works! (now write some real specs)" do
      get nadaserves_path
      expect(response).to have_http_status(200)
    end
  end
end
