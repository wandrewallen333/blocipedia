class Wiki < ApplicationRecord
  belongs_to :user
  scope :visible_to, -> (user) { user ? all : where(private: false) }

  def publicize
    update_attribute(:private, false)
  end

  default_scope { order('created_at DESC') }
end
