class User < ActiveRecord::Base
  has_many :rounds

  validates :username, uniqueness: true, presence: true
  validates :password, presence: true

 def self.valid?(username)
    User.exists?(username: username)
  end

   def authenticate(attempted_password)
    if self.password == attempted_password
      true
    else
      false
    end
  end

end
