class PayPalPaymentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
    	scope
    end
  end

  def paypal?
  	user
  end

end