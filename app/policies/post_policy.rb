class PostPolicy < ApplicationPolicy

  class Scope < Scope
    def index?
      true
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(:published => true)
      end
    end
  end

end
