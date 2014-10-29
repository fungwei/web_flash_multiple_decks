class Guess < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :round

  validates :round_id, presence: true
end
