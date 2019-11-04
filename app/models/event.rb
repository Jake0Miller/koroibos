class Event < ApplicationRecord
  validates_presence_of :event, :sport
  has_many :olympian_events
  has_many :olympians, through: :olympian_events
end
