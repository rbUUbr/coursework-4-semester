class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.new_record?
      send :guest
    else
      if user && user.role == "admin"
        can :access, :rails_admin       # only allow admin users to access Rails Admin
        can :dashboard                  # allow access to dashboard
        if user.role == "superadmin"
          can :manage, :all
        end
      end
      can :read, :all
      can :manage, SelectedQueue, user: { user_id: user.id }
    end
  end

  def guest

  end

  def authorized_user(user)
    can :manage, :all
  end

end
