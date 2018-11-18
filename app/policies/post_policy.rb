class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.limit(20).order("created_at desc")
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    record.user == user
  end

  def indexByUser?
    true
  end

end
