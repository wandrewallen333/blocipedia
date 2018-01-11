class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis, dependent: :destroy
  has_many :collaborators# , dependant: :destroy
  #has_many :collaborations, through: :wiki_collaborators, source: :wiki, class_name: 'Wiki'

  #before_save { self.role ||= :standard }

  def going_public
    self.wikis.each { |wiki| puts wiki.publicize }
  end

  enum role: [:standard, :premium, :admin]
end
