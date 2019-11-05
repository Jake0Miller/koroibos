require 'rails_helper'

RSpec.describe Event do
  describe 'Relationships' do
    it {should have_many :olympian_events}
    it {should have_many(:olympians).through(:olympian_events)}
  end

  describe 'Validations' do
    it {should validate_presence_of :event}
    it {should validate_presence_of :sport}
  end

  describe 'methods' do
    before :each do
      oly_1 = Olympian.create!(name: 'Bob', sex: 'M', age: 20, height: 150, weight: 100, team: 'Romania', sport: 'Swimming')
      oly_2 = Olympian.create!(name: 'Jane', sex: 'M', age: 30, height: 150, weight: 120, team: 'USA', sport: 'Swimming')
      oly_3 = Olympian.create!(name: 'Jim', sex: 'F', age: 40, height: 150, weight: 100, team: 'Russia', sport: 'Swimming')
      oly_4 = Olympian.create!(name: 'Joe', sex: 'F', age: 50, height: 150, weight: 100, team: 'Russia', sport: 'Running')
      @event = Event.create!(sport: 'Swimming', event: 'Underwater Basket Weaving')
      @event_2 = Event.create!(sport: 'Running', event: 'From Bears')
      OlympianEvent.create!(olympian: oly_1, event: @event, medal: 'Gold')
      OlympianEvent.create!(olympian: oly_2, event: @event, medal: 'Silver')
      OlympianEvent.create!(olympian: oly_3, event: @event)
      OlympianEvent.create!(olympian: oly_4, event: @event_2, medal: 'Bronze')
    end

    it 'self.medalists' do
      olympians = Event.medalists(@event.id)

      medalists = olympians["medalists"]
      event = olympians["event"]

      expect(event).to eq('Underwater Basket Weaving')
      expect(medalists.length).to eq(2)
      expect(medalists.first).to eq({name: 'Bob', team: 'Romania', age: 20, medal: 'Gold'})
      expect(medalists.second).to eq({name: 'Jane', team: 'USA', age: 30, medal: 'Silver'})

      olympians = Event.medalists(@event_2.id)

      medalists = olympians["medalists"]
      event = olympians["event"]

      expect(event).to eq('From Bears')
      expect(medalists.length).to eq(1)
      expect(medalists.first).to eq({name: 'Joe', team: 'Russia', age: 50, medal: 'Bronze'})
    end
  end
end
