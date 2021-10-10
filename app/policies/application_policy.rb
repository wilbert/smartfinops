class ApplicationPolicy
  attr_reader :current_user, :model, :resource_name

  def initialize(current_user, model)
    @current_user = current_user
    @model = model
    @resource_name = @model.is_a?(Class) ? @model.to_s : @model.class.to_s
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
