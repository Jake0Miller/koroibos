require 'rails_helper'

describe 'GET /api/v1/events' do
  before :each do
    Event.create!(sport: 'Swimming', event: 'Underwater Basket Weaving')
    Event.create!(sport: 'Swimming', event: 'Water Polo')
    Event.create!(sport: 'Running', event: '100m')
    Event.create!(sport: 'Running', event: '200m')
    Event.create!(sport: 'Running', event: '200000000m')
  end

  it 'sends a list of events' do
    get '/api/v1/events'

    expect(response).to be_successful

    events = JSON.parse(response.body, symbolize_names: true)[:events]

    expect(stats.length).to eq(3)
    expect(stats[:total_competing_olympians]).to eq(3)
    expect(stats[:average_age]).to eq(30)
    expect(stats[:average_weight]).to eq({unit: "kg", male_olympians: 110, female_olympians: 100})
  end
end
