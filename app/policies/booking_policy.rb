class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def accept?
    record.venue.user == user
  end

  def reject?
    record.venue.user == user
  end
end
