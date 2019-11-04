require 'rails_helper'

describe 'GET /api/v1/olympians' do
  before :each do
    oly_1 = Olympian.create!(name: 'Bob', sex: 'X', age: 20, height: 150, weight: 100, team: 'Romania', sport: 'Underwater Basket Weaving')
    oly_2 = Olympian.create!(name: 'Jane', sex: 'X', age: 30, height: 150, weight: 100, team: 'USA', sport: 'Underwater Basket Weaving')
    oly_3 = Olympian.create!(name: 'Jim', sex: 'X', age: 40, height: 150, weight: 100, team: 'Russia', sport: 'Underwater Basket Weaving')
    event = Event.create!(event: 'Underwater Basket Weaving')
    OlympianEvent.create!(olympian: oly_1, event: event, medal: 'Gold')
    OlympianEvent.create!(olympian: oly_2, event: event, medal: 'Silver')
    OlympianEvent.create!(olympian: oly_3, event: event)
  end

  it 'sends a list of all Olympians' do
    get '/api/v1/olympians'

    expect(response).to be_successful

    olympians = JSON.parse(response.body, symbolize_names: true)[:olympians]

    expect(olympians.length).to eq(3)
    expect(olympians.first).to eq({:name=>"Bob", :team=>"Romania", :age=>20, :sport=>"Underwater Basket Weaving", :total_medals_won=>1})
    expect(olympians.second).to eq({:name=>"Jane", :team=>"USA", :age=>30, :sport=>"Underwater Basket Weaving", :total_medals_won=>1})
    expect(olympians.third).to eq({:name=>"Jim", :team=>"Russia", :age=>40, :sport=>"Underwater Basket Weaving", :total_medals_won=>0})
  end

  it 'sends the youngest Olympian' do
    get '/api/v1/olympians?age=youngest'

    expect(response).to be_successful

    olympian = JSON.parse(response.body, symbolize_names: true)
    
    expect(olympian).to eq([{:name=>"Bob", :team=>"Romania", :age=>20, :sport=>"Underwater Basket Weaving", :total_medals_won=>1}])
  end
end
