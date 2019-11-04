require 'rails_helper'

describe 'GET /api/v1/olympian_stats' do
  before :each do
    oly_1 = Olympian.create!(name: 'Bob', sex: 'M', age: 20, height: 150, weight: 100, team: 'Romania', sport: 'Underwater Basket Weaving')
    oly_2 = Olympian.create!(name: 'Jane', sex: 'M', age: 30, height: 150, weight: 120, team: 'USA', sport: 'Underwater Basket Weaving')
    oly_3 = Olympian.create!(name: 'Jim', sex: 'F', age: 40, height: 150, weight: 100, team: 'Russia', sport: 'Underwater Basket Weaving')
    event = Event.create!(event: 'Underwater Basket Weaving')
    OlympianEvent.create!(olympian: oly_1, event: event, medal: 'Gold')
    OlympianEvent.create!(olympian: oly_2, event: event, medal: 'Silver')
    OlympianEvent.create!(olympian: oly_3, event: event)
  end

  it 'sends a list of Olympian stats' do
    get '/api/v1/olympian_stats'

    expect(response).to be_successful

    stats = JSON.parse(response.body, symbolize_names: true)[:olympian_stats]

    expect(stats.length).to eq(3)
    expect(stats[:total_competing_olympians]).to eq(3)
    expect(stats[:average_age]).to eq(3)
    expect(stats[:average_weight]).to eq({unit: "kg", male_olympians: 110, female_olympians: 100})
  end
end
