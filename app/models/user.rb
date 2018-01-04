class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis, dependent: :destroy

  #before_save { self.role ||= :standard }

  def going_public
    self.wikis.each { |wiki| puts wiki.publicize }
  end 

  enum role: [:standard, :premium, :admin]
end
