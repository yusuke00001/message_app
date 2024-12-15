class User < ApplicationRecord
  authenticates_with_sorcery!

  attr_accessor :password_confirmation

  has_many :groups, through: :user_groups
  has_many :messages

  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
end
