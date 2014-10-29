class Round < ActiveRecord::Base
  # Remember to create a migration!
  has_many     :guesses
  belongs_to   :user

  validates :user_id, presence: true
end
