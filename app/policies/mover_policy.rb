class MoverPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true  # Anyone can view a mover
  end

  def create?
    true  # Anyone can create a mover
  end

  def update?
    record.user == user  # Only mover creator can update it
  end

  def destroy?
    record.user == user  # Only mover creator can update it
  end

end
