class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, :all
      if user.new_record?
        send :guest
      else
        send :authorized_user, user
      end
  end

  def guest
    can :read, :all
  end

  def authorized_user(user)
    can :manage, :all
  end

end
