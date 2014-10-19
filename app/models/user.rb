class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_secure_password

  before_save :email_in_small
  before_create :create_remember_token

  def email_in_small
    self.email = email.downcase
  end

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt_remember_token(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt_remember_token(User.new_remember_token)
  end
end
