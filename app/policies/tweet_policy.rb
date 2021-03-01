class TweetPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      scope.all
    end

    def new?
      create?
    end

    def update?
      create?
    end

    def edit?
      true
      # record.user == user || user.is_contributor?
    end

    def create?
      user.present? && (record.user == user || user.admin?)
      true
    end
  end
end
