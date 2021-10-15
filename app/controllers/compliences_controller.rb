class CompliencesController < ApplicationController
  before_action :set_complience, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json, :xml

  def index
    authorize Complience, :index?
    @search = Complience.search(params[:q])
    @compliences = @search.result.paginate(page: params[:page])
    respond_with @compliences
  end

  def show
    authorize @complience, :show?
    respond_with @complience
  end

  def new
    @complience = Complience.new
    authorize @complience, :create?
    respond_with @complience
  end

  def edit
    authorize @complience, :update?
    respond_with @complience
  end

  def create
    @complience = Complience.new(complience_params)
    authorize @complience, :create?
    respond_with @complience do |format|
      if @complience.save
        format.html do
          flash[:notice] = I18n.t(:created, model: I18n.t(:complience, scope: "activerecord.models"))
          redirect_to @complience
        end
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    authorize @complience, :update?
    respond_with @complience do |format|
      if @complience.update(complience_params)
        format.html do
          flash[:notice] = I18n.t(:updated, model: I18n.t(:complience, scope: "activerecord.models"))
          redirect_to @complience
        end
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    authorize @complience, :destroy?
    flash[:alert] = I18n.t(:removed, model: I18n.t(:complience, scope: "activerecord.models")) if @complience.destroy
    respond_with @complience, location: compliences_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_complience
    @complience = Complience.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def complience_params
    params.require(:complience).permit(:rule_name, :weight, :deadline, :required_by_law)
  end
end
