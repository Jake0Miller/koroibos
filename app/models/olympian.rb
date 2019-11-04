class Olympian < ApplicationRecord
  validates_presence_of :name, :sex, :age, :height,
                       :weight, :team, :sport

  has_many :olympian_events
  has_many :events, through: :olympian_events

  def total_medals_won
    OlympianEvent.where({olympian: self, medal: ['Bronze', 'Silver', 'Gold']}).count
  end

  def format_response
    {
      name: self.name,
      team: self.team,
      age: self.age,
      sport: self.sport,
      total_medals_won: self.total_medals_won
    }
  end

  def self.youngest
    order(age: :ASC).limit(1)
  end
end
