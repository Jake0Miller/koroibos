require 'rails_helper'

describe 'GET /api/v1/olympians' do
  it 'sends a list of all Olympians' do
    Olympian.create!(name: 'Bob', sex: 'X', age: 20, height: 150, weight: 100, team: 'Romania', sport: 'Underwater Basket Weaving')
    Olympian.create!(name: 'Jane', sex: 'X', age: 20, height: 150, weight: 100, team: 'USA', sport: 'Underwater Basket Weaving')
    Olympian.create!(name: 'Jim', sex: 'X', age: 20, height: 150, weight: 100, team: 'Russia', sport: 'Underwater Basket Weaving')

    get '/api/v1/olympians'

    expect(response).to be_successful

    olympians = JSON.parse(response.body)["olympians"]

    expect(olympians.length).to eq(3)
  end
end
