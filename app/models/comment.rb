class Comment < ApplicationRecord
  belongs_to :post
  validates_presence_of :body
  belongs_to :user, class_name: "User"
end
