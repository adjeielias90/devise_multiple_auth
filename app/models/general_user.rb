class GeneralUser < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  belongs_to :provider
  has_many :ldap_users, dependent: :delete_all
  has_many :radius_users, dependent: :delete_all
end
