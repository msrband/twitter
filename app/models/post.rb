class Post < ApplicationRecord
  # Touch will update the timestamp on the user when
  # a post is created, updated, or destroyed.
  belongs_to :user, touch: true

  validates :body, presence: true, length: { maximum: 50 }

  # When the model is changed, a message will sent over ActionCable.
  broadcasts_refreshes
end
