class Deck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :cards

  validates :title, presence: true
end
