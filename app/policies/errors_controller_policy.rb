class ErrorsControllerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def error404?
    true
  end
end
