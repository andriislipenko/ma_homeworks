class Post < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :category, optional: true
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :chosen_by_users, join_table: 'chosen_posts', class_name: 'User'

  validates :title, presence: true
end