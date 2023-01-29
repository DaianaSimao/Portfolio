class Post < ApplicationRecord
    validates :title, :author, :body, presence: true

    has_many :comments, dependent: :destroy # destroy associated comments
end
