class SitePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where(user: user)
      scope.all
    end
  end

  def show?
    false #tous les users peuvent voir tous les sites
  end

  def create?
    user.admin #seul les users admin peuvent créer des sites
  end

  def update?
                            #seul le owner ou l'admin du site peut le modifier
    user_is_owner_or_admin? #record => @site
                            #user => current_user
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    user.admin || record.user == user
  end
end
