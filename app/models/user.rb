class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  has_many :questions, dependent: :destroy
  has_many :answers

  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true, length: { maximum: 15 }
  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 5 }

  def downcase_nickname
    nickname.downcase!
  end
end
