class User < ApplicationRecord
  has_secure_password

  has_many :questions, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true
  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
end
