class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    record.user == user || user.is_contributor?
  end

  def show?
    return true
  end
end
