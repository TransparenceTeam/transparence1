class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new
    create?
  end

  def create?
    record.user == user || user.is_contributer?
    true
  end

  def update?
    edit?
  end

  def edit?
    record.user == user || user.is_contributer?
    true
  end

  def show?
    return true
  end
end
