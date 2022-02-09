class User < ApplicationRecord
  has_many :posts, foreign_key: 'owner_id', dependent: :destroy
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :chosen_posts, table_name: 'chosen_posts', class_name: 'Post'

  has_secure_password

  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP

  def to_json_password_excluded
    to_json(except: :password_digest)
  end
end
