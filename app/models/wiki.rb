class Wiki < ApplicationRecord
  belongs_to :user

  #scope :visible_to, -> (user) { user ? all : where(private: false) }
  has_many :collaborators
  has_many :users, through: :collaborators

  def publicize
    update_attribute(:private, false)
  end

  def public
    where(private: false)
  end

  default_scope { order('created_at DESC') }


end
