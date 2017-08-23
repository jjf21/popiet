class WishlistsPlacePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user
  end

  def destroy?
    record.wishlist.user_id == user.id
  end
end
