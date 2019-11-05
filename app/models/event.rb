class Event < ApplicationRecord
  validates_presence_of :event, :sport
  has_many :olympian_events
  has_many :olympians, through: :olympian_events

  def self.medalists(id)
    event = self.includes(:olympians).where(id: id)[0]
    medals = event.olympian_events.where(medal: ['Gold', 'Silver', 'Bronze'])
    olympians = medals.map do |medal|
      olympian = medal.olympian
      {name: olympian.name, team: olympian.team, age: olympian.age, medal: medal.medal}
    end
    {"event" => event.event, "medalists" => olympians}
  end
end
