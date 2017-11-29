class User < ApplicationRecord
  validates :username, :password_digest, :session_token, null: false
  validates :session_token, uniqueness: true

  after_initialize :ensure_session_token

  has_many :cats,
    foreign_key: :user_id,
    class_name: :Cat

  has_many :cat_rental_requests

  def create
    user = User.new(user_params)
    if user.save!
      redirect_to cats_url
    else
      render json: 'Error'
    end
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    return user if user && user.is_password?(password)
    nil
  end



end
