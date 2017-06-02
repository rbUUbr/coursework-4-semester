class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    @user = user
    if user.new_record?
      send :guest
    else
      can :read, :all
      if user.role == 'admin'
        send :admin
      elsif user.role == "superadmin"
        send :superadmin
      else
        send :student
      end
    end
  end

  def guest
    can :read, LabQueue
    can :read, Schedule
  end

  def admin
    can :access, :rails_admin       # only allow admin users to access Rails Admin
    can :dashboard
  end

  def superadmin
    can :manage, :all
  end

  def student
    can :manage, SelectedQueue
    can :manage, LabQueue
  end
end
