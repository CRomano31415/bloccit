class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy

  default_scope { order('created_at DESC') }

  #ordered by title scope
  scope :ordered_by_title, ->{ order('title')}

  #ordered by reverse created at scope
  scope :ordered_by_reverse_created_at, ->{ order('created_at ASC')}

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true
end
