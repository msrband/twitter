class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  broadcasts_refreshes
end
