class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
    	scope
    end
  end

  def index?
  	user
  end

  def create?
  	user.admin?
  end

  def update?
  	user.admin?
  end

  def destroy?
  	user.admin?
  end
end
