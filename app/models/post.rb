class Post < ApplicationRecord
  validates :content,presence: true,length:{in: 1..140}
end
