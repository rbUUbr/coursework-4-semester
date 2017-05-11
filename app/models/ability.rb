class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
      send :guest
  end

  def guest
    can :manage, :all
  end

end
