require "rails_helper"

RSpec.describe CompliancesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/compliances").to route_to("compliances#index")
    end

    it "routes to #new" do
      expect(get: "/compliances/new").to route_to("compliances#new")
    end

    it "routes to #show" do
      expect(get: "/compliances/1").to route_to("compliances#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/compliances/1/edit").to route_to("compliances#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/compliances").to route_to("compliances#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/compliances/1").to route_to("compliances#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/compliances/1").to route_to("compliances#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/compliances/1").to route_to("compliances#destroy", id: "1")
    end
  end
end
