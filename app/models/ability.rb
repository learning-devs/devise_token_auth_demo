class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
        can :manage, Product
    else
        can :read , Product
    end
  end
end
