class User < ApplicationRecord
  has many :groups, through: :user_groups
  has many :messages
end
