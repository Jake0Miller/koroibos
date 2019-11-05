require 'rails_helper'

describe 'GET /api/v1/events/:id/medalists' do
  before :each do
    oly_1 = Olympian.create!(name: 'Bob', sex: 'M', age: 20, height: 150, weight: 100, team: 'Romania', sport: 'Underwater Basket Weaving')
    oly_2 = Olympian.create!(name: 'Jane', sex: 'M', age: 30, height: 150, weight: 120, team: 'USA', sport: 'Underwater Basket Weaving')
    oly_3 = Olympian.create!(name: 'Jim', sex: 'F', age: 40, height: 150, weight: 100, team: 'Russia', sport: 'Underwater Basket Weaving')
    @event = Event.create!(sport: 'Swimming', event: 'Underwater Basket Weaving')
    @event_2 = Event.create!(sport: 'Running', event: 'From Bears')
    OlympianEvent.create!(olympian: oly_1, event: @event, medal: 'Gold')
    OlympianEvent.create!(olympian: oly_2, event: @event, medal: 'Silver')
    OlympianEvent.create!(olympian: oly_3, event: @event)
    OlympianEvent.create!(olympian: oly_1, event: @event_2, medal: 'Bronze')
  end

  it 'sends a list of medalists for an event' do
    get "/api/v1/events/#{@event.id}/medalists"

    expect(response).to be_successful

    response = JSON.parse(response.body, symbolize_names: true)
    medalists = response[:medalists]
    event = response[:event]

    expect(event).to eq('Underwater Basket Weaving')
    expect(medalists.length).to eq(2)
    expect(medalists.first).to eq({name: 'Bob', team: 'Romania', age: 20, medal: 'Gold'})
    expect(medalists.second).to eq({name: 'Jane', team: 'USA', age: 30, medal: 'Silver'})

    get "/api/v1/events/#{@event_2.id}/medalists"

    expect(response).to be_successful

    response = JSON.parse(response.body, symbolize_names: true)
    medalists = response[:medalists]
    event = response[:event]

    expect(event).to eq('From Bears')
    expect(medalists.length).to eq(2)
    expect(medalists.first).to eq({name: 'Bob', team: 'Romania', age: 20, medal: 'Bronze'})
  end
end
