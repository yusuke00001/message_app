class User < ApplicationRecord
  has many :groups, through: :user_groups
end
