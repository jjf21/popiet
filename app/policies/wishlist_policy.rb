class WishlistPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    user
  end

  def destroy?
    record.user_id == user.id
  end
end
