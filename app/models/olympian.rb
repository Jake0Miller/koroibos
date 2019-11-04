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

  def self.by_age(order)
    order(age: order).limit(1)
  end

  def self.stats
    olympians = Olympian.all
    males = olympians.find_all {|olympian| olympian.sex == 'M'}
    females = olympians.find_all {|olympian| olympian.sex == 'F'}
    {
      total_competing_olympians: olympians.length,
      average_weight: {
        unit: "kg",
        male_olympians: (males.sum(&:weight) / males.length).round(1),
        female_olympians: (females.sum(&:weight) / females.length).round(1)
      },
      average_age: (olympians.sum(&:age) / olympians.length).round(1)
    }
  end
end
