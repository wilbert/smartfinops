class ApplicationController < ActionController::Base
  # include Pundit

  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def user_not_authorized
    respond_to do |format|
      format.html do
        flash[:alert] = I18n.t(:you_are_not_authorized_to_perform_this_action)
        redirect_to(request.referer || error_home_path)
      end
      format.json { render json: { error: I18n.t(:you_are_not_authorized_to_perform_this_action) }, status: 422 }
    end
  end
end
