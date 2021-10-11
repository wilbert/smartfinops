require "rails_helper"

RSpec.describe CloudStacksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cloud_stacks").to route_to("cloud_stacks#index")
    end

    it "routes to #new" do
      expect(get: "/cloud_stacks/new").to route_to("cloud_stacks#new")
    end

    it "routes to #show" do
      expect(get: "/cloud_stacks/1").to route_to("cloud_stacks#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cloud_stacks/1/edit").to route_to("cloud_stacks#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cloud_stacks").to route_to("cloud_stacks#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cloud_stacks/1").to route_to("cloud_stacks#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cloud_stacks/1").to route_to("cloud_stacks#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cloud_stacks/1").to route_to("cloud_stacks#destroy", id: "1")
    end
  end
end
