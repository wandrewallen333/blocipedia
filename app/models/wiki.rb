class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  #has_many :collaborators, through: :wiki_collaborators, dependent: :destroy, class_name: 'User'

  #scope :visible_to, -> (user) { user ? all : where(private: false) }


  def publicize
    update_attribute(:private, false)
  end

  def public
    where(private: false)
  end

  default_scope { order('created_at DESC') }

  #scope :visible_to_login, -> (user) { user.admin? || user.premium? ? all : where(private: [false, nil])}
  #scope :visible_to_all, -> {where(private: [false, nil])}


   def collaborators
     Collaborator.where(wiki_id: id)
   end


end
