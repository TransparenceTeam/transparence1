class TweetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def update?
      edit?
    end

    def edit?
      record.user == user || user.is_contributor?
    end
  end
end
