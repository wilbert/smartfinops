require "rails_helper"

RSpec.describe CompliencesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/compliences").to route_to("compliences#index")
    end

    it "routes to #new" do
      expect(get: "/compliences/new").to route_to("compliences#new")
    end

    it "routes to #show" do
      expect(get: "/compliences/1").to route_to("compliences#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/compliences/1/edit").to route_to("compliences#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/compliences").to route_to("compliences#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/compliences/1").to route_to("compliences#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/compliences/1").to route_to("compliences#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/compliences/1").to route_to("compliences#destroy", id: "1")
    end
  end
end
