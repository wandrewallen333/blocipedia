class WikiPolicy < ApplicationPolicy

  def index?

  end

  def destroy?
    user.admin? || user.id == record.user_id
  end

  class Scope
     attr_reader :user, :scope

     def initialize(user, scope)
       @user = user
       @scope = scope
     end

     def resolve
       wikis = []
       if user.role == 'admin'
         wikis = scope.all
       elsif user.role == 'premium'
         all_wikis = scope.all
         all_wikis.each do |wiki|
           if wiki.user == user || wiki.collaborators.pluck(:user_id).include?(user.id)
             wikis << wiki
           end
         end
       else
         all_wikis = scope.all
         wikis = []
         all_wikis.each do |wiki|
           if wiki.collaborators.pluck(:user_id).include?(user.id)
             wikis << wiki
           end
         end
       end
       wikis
     end
   end

end
