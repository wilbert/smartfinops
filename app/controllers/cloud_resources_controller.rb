class CloudResourcesController < ApplicationController
  before_action :set_cloud_resource, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json, :xml

  def index
    authorize CloudResource, :index?
    @search = CloudResource.search(params[:q])
    @cloud_resources = @search.result.paginate(page: params[:page])
    respond_with @cloud_resources
  end

  def show
    authorize @cloud_resource, :show?
    respond_with @cloud_resource
  end

  def new
    @cloud_resource = CloudResource.new
    authorize @cloud_resource, :create?
    respond_with @cloud_resource
  end

  def edit
    authorize @cloud_resource, :update?
    respond_with @cloud_resource
  end

  def create
    @cloud_resource = CloudResource.new(cloud_resource_params)
    authorize @cloud_resource, :create?
    respond_with @cloud_resource do |format|
      if @cloud_resource.save
        format.html do
          flash[:notice] = I18n.t(:created, model: I18n.t(:cloud_resource, scope: "activerecord.models"))
          redirect_to @cloud_resource
        end
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    authorize @cloud_resource, :update?
    respond_with @cloud_resource do |format|
      if @cloud_resource.update(cloud_resource_params)
        format.html do
          flash[:notice] = I18n.t(:updated, model: I18n.t(:cloud_resource, scope: "activerecord.models"))
          redirect_to @cloud_resource
        end
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    authorize @cloud_resource, :destroy?
    flash[:alert] = I18n.t(:removed, model: I18n.t(:cloud_resource, scope: "activerecord.models")) if @cloud_resource.destroy
    respond_with @cloud_resource, location: cloud_resources_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cloud_resource
    @cloud_resource = CloudResource.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cloud_resource_params
    params.require(:cloud_resource).permit(:identifier, :service, :name, :service_type, :region, :correct_app_tag, :app_env, :cloud_stack_id)
  end
end
