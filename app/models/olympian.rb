class Olympian < ApplicationRecord
  validates_presence_of :name, :sex, :age, :height,
                       :weight, :team, :sport

  has_many :olympian_events
  has_many :events, through: :olympian_events
end
