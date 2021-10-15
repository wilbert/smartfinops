 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/compliences", type: :request do
  # Complience. As you add validations to Complience, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Complience.create! valid_attributes
      get compliences_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      complience = Complience.create! valid_attributes
      get complience_url(complience)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_complience_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      complience = Complience.create! valid_attributes
      get edit_complience_url(complience)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Complience" do
        expect {
          post compliences_url, params: { complience: valid_attributes }
        }.to change(Complience, :count).by(1)
      end

      it "redirects to the created complience" do
        post compliences_url, params: { complience: valid_attributes }
        expect(response).to redirect_to(complience_url(Complience.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Complience" do
        expect {
          post compliences_url, params: { complience: invalid_attributes }
        }.to change(Complience, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post compliences_url, params: { complience: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested complience" do
        complience = Complience.create! valid_attributes
        patch complience_url(complience), params: { complience: new_attributes }
        complience.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the complience" do
        complience = Complience.create! valid_attributes
        patch complience_url(complience), params: { complience: new_attributes }
        complience.reload
        expect(response).to redirect_to(complience_url(complience))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        complience = Complience.create! valid_attributes
        patch complience_url(complience), params: { complience: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested complience" do
      complience = Complience.create! valid_attributes
      expect {
        delete complience_url(complience)
      }.to change(Complience, :count).by(-1)
    end

    it "redirects to the compliences list" do
      complience = Complience.create! valid_attributes
      delete complience_url(complience)
      expect(response).to redirect_to(compliences_url)
    end
  end
end
