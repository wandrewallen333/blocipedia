class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis, dependent: :destroy

  has_many :collaborators
  has_many :wiki_collabs, source: 'wiki', through: :collaborators

  #before_save { self.role ||= :standard }

  def going_public
    self.wikis.each { |wiki| puts wiki.publicize }
  end

  enum role: [:standard, :premium, :admin]
end
