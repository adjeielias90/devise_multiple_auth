class RadiusUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :radius_authenticatable, :registerable,
         :recoverable, :rememberable,  :authentication_keys => [:username]

  validates :username, uniqueness: true
  belongs_to :general_user
end
