class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role? :track_manager
      can :manage, :all
      
    elsif user.role? :check_in
      can :manage, Scout
      
    elsif user.role? :car_staging
      can :manage, Scout
    end
  end
end
