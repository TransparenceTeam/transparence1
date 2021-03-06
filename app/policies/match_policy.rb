class MatchPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def new?
      create?
    end

    def update?
      edit?
    end

    def edit?
      true
    end

    def create?
      true
      record.user == user || user.is_contributer?
    end

end
