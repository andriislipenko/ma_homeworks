class User < ApplicationRecord
  has_one :shop, dependent: :destroy
  validates :first_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_length_of :phone_number, in: 1..12, allow_blank: true
end
