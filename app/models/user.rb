class User < ActiveRecord::Base
  has_many :rounds

  validates :username, uniqueness: true, presence: true
  validates :password, presence: true
end
