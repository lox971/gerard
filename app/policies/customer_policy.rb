class CustomerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true  # Anyone can view a customer
  end

  def create?
    true  # Anyone can create a customer
  end

  def update?
    record.user == user  # Only customer creator can update it
  end

  def destroy?
    record.user == user  # Only customer creator can update it
  end

end
