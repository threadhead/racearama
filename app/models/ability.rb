class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role? :manager
      can :manage, :all
      
    elsif user.role? :checkin
      can :manage, Scout
      
    elsif user.role? :staging
      can :manage, Scout
    end
  end
end
