require "rails_helper"

RSpec.describe CloudResourcesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cloud_resources").to route_to("cloud_resources#index")
    end

    it "routes to #new" do
      expect(get: "/cloud_resources/new").to route_to("cloud_resources#new")
    end

    it "routes to #show" do
      expect(get: "/cloud_resources/1").to route_to("cloud_resources#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cloud_resources/1/edit").to route_to("cloud_resources#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cloud_resources").to route_to("cloud_resources#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cloud_resources/1").to route_to("cloud_resources#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cloud_resources/1").to route_to("cloud_resources#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cloud_resources/1").to route_to("cloud_resources#destroy", id: "1")
    end
  end
end
