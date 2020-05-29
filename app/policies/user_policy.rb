class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def profile?
    true
  end

  def edit?
    true
  end

  def new?
    true
  end

end
