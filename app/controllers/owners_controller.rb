class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json, :xml

  def index
    authorize Owner, :index?
    @search = Owner.search(params[:q])
    @owners = @search.result.paginate(page: params[:page])
    respond_with @owners
  end

  def show
    authorize @owner, :show?
    respond_with @owner
  end

  def new
    @owner = Owner.new
    authorize @owner, :create?
    respond_with @owner
  end

  def edit
    authorize @owner, :update?
    respond_with @owner
  end

  def create
    @owner = Owner.new(owner_params)
    authorize @owner, :create?
    respond_with @owner do |format|
      if @owner.save
        format.html do
          flash[:notice] = I18n.t(:created, model: I18n.t(:owner, scope: "activerecord.models"))
          redirect_to @owner
        end
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    authorize @owner, :update?
    respond_with @owner do |format|
      if @owner.update(owner_params)
        format.html do
          flash[:notice] = I18n.t(:updated, model: I18n.t(:owner, scope: "activerecord.models"))
          redirect_to @owner
        end
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    authorize @owner, :destroy?
    flash[:alert] = I18n.t(:removed, model: I18n.t(:owner, scope: "activerecord.models")) if @owner.destroy
    respond_with @owner, location: owners_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_owner
    @owner = Owner.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def owner_params
    params.require(:owner).permit(:name, :email)
  end
end
