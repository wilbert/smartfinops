class HomesController < ApplicationController
  skip_after_action :verify_authorized, only: :index

  def index
    skip_policy_scope
  end
end
