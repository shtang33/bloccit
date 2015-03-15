class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  # no user will be able to see a list of resources (ie: when accessing /posts)
  def index?
    false
  end

  # default rule for showing a record (as in when viewing /posts/13), is to ensure a record exists
  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present? && (record.user == user || user.admin?)
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  # scope will simply return the class of the record being authorized
  # For a post instance it will return the Post class
  def scope
    record.class
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end

