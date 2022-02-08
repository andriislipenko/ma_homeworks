class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP

  def to_json_password_excluded
    to_json(except: :password_digest)
  end
end
