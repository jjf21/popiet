class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.orders.where("state ILIKE?", "paid")
    end
  end

  def create? 
    user
  end
end
