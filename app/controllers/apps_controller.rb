class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json, :xml

  def index
    authorize App, :index?
    params[:q] ||= {}
    params[:per_page] ||= 50
    @search = App.ransack(params[:q])
    @apps = @search.result.paginate(page: params[:page])
    respond_with @apps
  end

  def show
    authorize @app, :show?
    respond_with @app
  end

  def new
    @app = App.new
    authorize @app, :create?
    respond_with @app
  end

  def edit
    authorize @app, :update?
    respond_with @app
  end

  def create
    @app = App.new(app_params)
    authorize @app, :create?
    respond_with @app do |format|
      if @app.save
        format.html do
          flash[:notice] = I18n.t(:created, model: I18n.t(:app, scope: "activerecord.models"))
          redirect_to @app
        end
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    authorize @app, :update?
    respond_with @app do |format|
      if @app.update(app_params)
        format.html do
          flash[:notice] = I18n.t(:updated, model: I18n.t(:app, scope: "activerecord.models"))
          redirect_to @app
        end
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    authorize @app, :destroy?
    flash[:alert] = I18n.t(:removed, model: I18n.t(:app, scope: "activerecord.models")) if @app.destroy
    respond_with @app, location: apps_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_app
    @app = App.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def app_params
    params.require(:app).permit(:name, :is_active, :critical_level, :is_internal, :business_alias, :repository_url, :app_tags, :owner_id)
  end
end
