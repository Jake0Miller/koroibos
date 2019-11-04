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

    expect(events.length).to eq(2)
    expect(events[:Swimming].length).to eq(2)
    expect(events[:Swimming]).to eq(["Underwater Basket Weaving", "Water Polo"])
    expect(events[:Running].length).to eq(3)
    expect(events[:Running]).to eq(['100m', "200m", "200000000m"])
  end
end
