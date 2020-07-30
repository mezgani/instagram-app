class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username,
             presence: true, 
             uniqueness: true,
             length: { minimum: 4, maximum: 20 }

has_one :profile, dependent: :destroy

  def display_name
    profile&.nickname || self.email.split('@').first
  end

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'Ellipse.svg'
    end
  end

  
end