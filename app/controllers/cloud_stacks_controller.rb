class CloudStacksController < ApplicationController
  before_action :set_app, only: [:new, :create, :destroy]
  before_action :set_cloud_stack, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json, :xml

  def show
    authorize @cloud_stack, :show?
    respond_with @cloud_stack
  end

  def new
    @cloud_stack = CloudStack.new
    authorize @cloud_stack, :create?
    respond_with @cloud_stack
  end

  def edit
    authorize @cloud_stack, :update?
    respond_with @cloud_stack
  end

  def create
    @cloud_stack = @app.cloud_stacks.new(cloud_stack_params)
    authorize @cloud_stack, :create?
    respond_with @cloud_stack do |format|
      if @cloud_stack.save
        format.html do
          flash[:notice] = I18n.t(:created, model: I18n.t(:cloud_stack, scope: "activerecord.models"))
          redirect_to @app
        end
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    authorize @cloud_stack, :update?
    respond_with @cloud_stack do |format|
      if @cloud_stack.update(cloud_stack_params)
        format.html do
          flash[:notice] = I18n.t(:updated, model: I18n.t(:cloud_stack, scope: "activerecord.models"))
          redirect_to @cloud_stack.app
        end
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    authorize @cloud_stack, :destroy?
    flash[:alert] = I18n.t(:removed, model: I18n.t(:cloud_stack, scope: "activerecord.models")) if @cloud_stack.destroy
    respond_with @app, location: @app
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cloud_stack
    @cloud_stack = CloudStack.find(params[:id])
  end

  def set_app
    @app = App.find(params[:app_id])
  end

  # Only allow a trusted parameter "white list" through.
  def cloud_stack_params
    params.require(:cloud_stack).permit(
      :name,
      :cloud_provider,
      :cloud_provider_id,
      :sla,
      :score,
      :status,
      :product_id,
      compliance_ids: []
    )
  end
end
