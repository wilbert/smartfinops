require 'rails_helper'

<% module_namespacing do -%>
RSpec.describe <%= controller_class_name %>Controller, <%= type_metatag(:controller) %> do

  let(:valid_attributes) {
    build(:<%= file_name %>).attributes
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let!(:<%= file_name %>) { create(:<%= file_name %>) }

<% unless options[:singleton] -%>
  describe "GET #index" do
    it "returns a success response" do
  <% if Rails::VERSION::STRING < '5.0' -%>
    get :index, {}
  <% else -%>
    get :index, params: {}
  <% end -%>
    expect(response).to be_successful
      expect(assigns(:<%= index_helper %>)).to eq([<%= file_name %>])
    end
  end
<% end -%>

  describe "GET #show" do
    it "returns a success response" do
<% if Rails::VERSION::STRING < '5.0' -%>
      get :show, { id: <%= file_name %>.to_param}
<% else -%>
      get :show, params: { id: <%= file_name %>.to_param }
<% end -%>
      expect(response).to be_successful
      expect(assigns(:<%= file_name %>)).to eq(<%= file_name %>)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
<% if Rails::VERSION::STRING < '5.0' -%>
      get :new, { <%= ns_file_name %>: valid_attributes }
<% else -%>
      get :new, params: { <%= ns_file_name %>: valid_attributes }
<% end -%>
      expect(response).to be_successful
      expect(assigns(:<%= file_name %>)).to be_a_new(<%= class_name %>)
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
<% if Rails::VERSION::STRING < '5.0' -%>
      get :edit, { :id => <%= file_name %>.to_param }
<% else -%>
      get :edit, params: { id: <%= file_name %>.to_param }
<% end -%>
      expect(response).to be_successful
      expect(assigns(:<%= file_name %>)).to eq(<%= file_name %>)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new <%= class_name %>" do
        expect {
<% if Rails::VERSION::STRING < '5.0' -%>
          post :create, { <%= ns_file_name %>: valid_attributes }
<% else -%>
          post :create, params: { <%= ns_file_name %>: valid_attributes }
<% end -%>
        }.to change(<%= class_name %>, :count).by(1)
      end

      it "redirects to the created <%= ns_file_name %>" do
<% if Rails::VERSION::STRING < '5.0' -%>
        post :create, { :<%= ns_file_name %> => valid_attributes }
<% else -%>
        post :create, params: { <%= ns_file_name %>: valid_attributes }
<% end -%>
        expect(response).to redirect_to(<%= class_name %>.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
<% if Rails::VERSION::STRING < '5.0' -%>
        post :create, { <%= ns_file_name %>: invalid_attributes }
<% else -%>
        post :create, params: { <%= ns_file_name %>: invalid_attributes }
<% end -%>
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested <%= ns_file_name %>" do
<% if Rails::VERSION::STRING < '5.0' -%>
        put :update, { id: <%= file_name %>.to_param, <%= ns_file_name %>: new_attributes }
<% else -%>
        put :update, params: { id: <%= file_name %>.to_param, <%= ns_file_name %>: new_attributes }
<% end -%>
        <%= file_name %>.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the <%= ns_file_name %>" do
<% if Rails::VERSION::STRING < '5.0' -%>
        put :update, { id: <%= file_name %>.to_param, <%= ns_file_name %>: new_attributes }
<% else -%>
        put :update, params: { id: <%= file_name %>.to_param, <%= ns_file_name %>: new_attributes }
<% end -%>
        expect(response).to redirect_to(<%= file_name %>)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
<% if Rails::VERSION::STRING < '5.0' -%>
        put :update, { id: <%= file_name %>.to_param, <%= ns_file_name %>: invalid_attributes }
<% else -%>
        put :update, params: { id: <%= file_name %>.to_param, <%= ns_file_name %>: invalid_attributes }
<% end -%>
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested <%= ns_file_name %>" do
      expect {
<% if Rails::VERSION::STRING < '5.0' -%>
        delete :destroy, { id: <%= file_name %>.to_param }
<% else -%>
        delete :destroy, params: { id: <%= file_name %>.to_param }
<% end -%>
      }.to change(<%= class_name %>, :count).by(-1)
    end

    it "redirects to the <%= table_name %> list" do
<% if Rails::VERSION::STRING < '5.0' -%>
      delete :destroy, { id: <%= file_name %>.to_param }
<% else -%>
      delete :destroy, params: { id: <%= file_name %>.to_param }
<% end -%>
      expect(response).to redirect_to(<%= index_helper %>_url)
    end
  end

end
<% end -%>
