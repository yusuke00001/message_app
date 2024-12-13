class UserGroup < ApplicationRecord
  belong_to :user
  belong_to :group
end
