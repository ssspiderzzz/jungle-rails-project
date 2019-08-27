class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 3 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :password_digest, presence: true

  def authenticate_with_credentials(email, password)
    if User.find_by(email: email.downcase.strip).try(:authenticate, password)
      @user = User.find_by_email(email.downcase.strip)
    else
      nil
    end
  end

end
