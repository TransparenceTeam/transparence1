class TweetPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      scope.all
    end

    def new?
      create?
    end

    def update?
      edit?
    end

    def edit?
      record.user == user || user.is_contributer?
      true
    end

    def create?
      record.user == user || user.is_contributer?
      true
    end
  end
end
