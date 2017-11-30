# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  password_digest :string           not null
#  session_token   :string           not null
#  email           :string           not null
#

class User < ApplicationRecord
  validates :email, :session_token, :password_digest, presence: true
  validates :email, :session_token, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}
  before_validation :ensure_session_token, only: [:new]
  
  attr_reader :password
  
  
  
  def ensure_session_token
    self.session_token = User.generate_session_token
  end
  
  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end
  
  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end 
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    unless user.nil?
      return user if user.is_password?(password)
    end 
    nil
  end
  
  
  
end 
