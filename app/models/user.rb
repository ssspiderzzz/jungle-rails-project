class User < ActiveRecord::Base
  has_secure_password(attribute = :password, validations: true)

  validates :name, presence: true
  validates :password_digest, presence: true
end
