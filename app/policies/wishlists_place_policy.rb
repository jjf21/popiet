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
    true
    #record.wishlist.
  end
end
