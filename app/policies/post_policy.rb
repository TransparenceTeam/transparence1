class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.user == user || user.is_contributer?
  end

  def update?
    record.user == user || user.is_contributer?
  end

  def show?
    true
  end
end
