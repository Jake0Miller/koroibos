class Olympian < ApplicationRecord
  has_many :olympian_events
  has_many :events, through: :olympian_events
end
