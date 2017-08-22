class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    user
  end

  def create?
    return true
  end
end
