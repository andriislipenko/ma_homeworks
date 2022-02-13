class Shop < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :user
  enum status: [:open, :closed, :blocked]
  validates :name, presence: true
end
