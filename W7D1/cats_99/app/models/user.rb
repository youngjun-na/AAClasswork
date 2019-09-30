# == Schema Information
#
# Table name: users
#
#  id              :integer(8)      not null, primary key
#  user_name       :string          not null
#  password_digest :string          not null
#  session_token   :string          not null
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#
class User < ApplicationRecord
  validates :user_name, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  before_validation :ensure_session_token

  attr_reader :password 

  has_many :cats, 
    foreign_key: :owner_id,
    class_name: :Cat,
    dependent: :destroy

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    user && user.is_password?(password) ? user : nil
  end
  
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
  def reset_session_token!
    self.update!(session_token: SecureRandom.urlsafe_base64(16))
    self.session_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password).to_s
    @password = password 
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

end
