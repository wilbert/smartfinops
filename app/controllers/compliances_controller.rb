class CompliancesController < ApplicationController
  before_action :set_compliance, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json, :xml

  def index
    authorize Compliance, :index?
    @search = Compliance.ransack(params[:q])
    @compliances = @search.result.paginate(page: params[:page])
    respond_with @compliances
  end

  def show
    authorize @compliance, :show?
    respond_with @compliance
  end

  def new
    @compliance = Compliance.new
    authorize @compliance, :create?
    respond_with @compliance
  end

  def edit
    authorize @compliance, :update?
    respond_with @compliance
  end

  def create
    @compliance = Compliance.new(compliance_params)
    authorize @compliance, :create?
    respond_with @compliance do |format|
      if @compliance.save
        format.html do
          flash[:notice] = I18n.t(:created, model: I18n.t(:compliance, scope: "activerecord.models"))
          redirect_to @compliance
        end
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    authorize @compliance, :update?
    respond_with @compliance do |format|
      if @compliance.update(compliance_params)
        format.html do
          flash[:notice] = I18n.t(:updated, model: I18n.t(:compliance, scope: "activerecord.models"))
          redirect_to @compliance
        end
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    authorize @compliance, :destroy?
    flash[:alert] = I18n.t(:removed, model: I18n.t(:compliance, scope: "activerecord.models")) if @compliance.destroy
    respond_with @compliance, location: compliances_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_compliance
    @compliance = Compliance.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def compliance_params
    params.require(:compliance).permit(:rule_name, :weight, :deadline, :required_by_law)
  end
end
