require "rails_helper"

RSpec.describe NadaservesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/nadaserves").to route_to("nadaserves#index")
    end

    it "routes to #new" do
      expect(:get => "/nadaserves/new").to route_to("nadaserves#new")
    end

    it "routes to #show" do
      expect(:get => "/nadaserves/1").to route_to("nadaserves#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/nadaserves/1/edit").to route_to("nadaserves#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/nadaserves").to route_to("nadaserves#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/nadaserves/1").to route_to("nadaserves#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/nadaserves/1").to route_to("nadaserves#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/nadaserves/1").to route_to("nadaserves#destroy", :id => "1")
    end

  end
end
