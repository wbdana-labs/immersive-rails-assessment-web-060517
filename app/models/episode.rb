class Episode < ApplicationRecord
  has_many :guest_episodes
  has_many :guests, through: :guest_episodes
end
