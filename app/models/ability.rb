class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, :all
    binding.pry
      if user.new_record?
        send :guest
      else
        send :authorized_user, user
      end
  end

  def guest

  end

  def authorized_user(user)
    can :manage, :all
  end

end
