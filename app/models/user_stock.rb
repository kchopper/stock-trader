# UserStock has the association of users and their stocks
class UserStock < ApplicationRecord
  belongs_to :user
  belongs_to :stock
end
