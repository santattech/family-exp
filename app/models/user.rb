class User < ActiveRecord::Base

  #validates :first_name, :presence => true, length: { maximum: 30}
  validates :email, :presence => true, :uniqueness => { case_sensitive: false}
  has_secure_password
  validates :password, :length => { minimum: 6}

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
