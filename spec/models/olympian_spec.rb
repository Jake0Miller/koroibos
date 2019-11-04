require 'rails_helper'

RSpec.describe Olympian do
  describe 'Relationships' do
    it {should have_many :olympian_events}
    it {should have_many(:events).through(:olympian_events)}
  end

  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :sex}
    it {should validate_presence_of :age}
    it {should validate_presence_of :height}
    it {should validate_presence_of :weight}
    it {should validate_presence_of :team}
    it {should validate_presence_of :sport}
  end

  describe 'Methods' do
    before :each do
      @oly_1 = Olympian.create!(name: 'Bob', sex: 'M', age: 20, height: 150, weight: 100, team: 'Romania', sport: 'Underwater Basket Weaving')
      @oly_2 = Olympian.create!(name: 'Jane', sex: 'M', age: 30, height: 150, weight: 100, team: 'USA', sport: 'Underwater Basket Weaving')
      @oly_3 = Olympian.create!(name: 'Jim', sex: 'F', age: 40, height: 150, weight: 100, team: 'Russia', sport: 'Underwater Basket Weaving')
      event = Event.create!(event: 'Underwater Basket Weaving')
      OlympianEvent.create!(olympian: @oly_1, event: event, medal: 'Gold')
      OlympianEvent.create!(olympian: @oly_2, event: event, medal: 'Silver')
      OlympianEvent.create!(olympian: @oly_3, event: event)
    end

    it 'total_medals_won' do
      expect(@oly_1.total_medals_won).to eq(1)
      expect(@oly_2.total_medals_won).to eq(1)
      expect(@oly_3.total_medals_won).to eq(0)
    end

    it 'format response' do
      expect(@oly_1.format_response).to eq({:name=>"Bob", :team=>"Romania", :age=>20, :sport=>"Underwater Basket Weaving", :total_medals_won=>1})
      expect(@oly_2.format_response).to eq({:name=>"Jane", :team=>"USA", :age=>30, :sport=>"Underwater Basket Weaving", :total_medals_won=>1})
      expect(@oly_3.format_response).to eq({:name=>"Jim", :team=>"Russia", :age=>40, :sport=>"Underwater Basket Weaving", :total_medals_won=>0})
    end

    it 'self.by_age(order)' do
      expect(Olympian.by_age(:ASC)).to eq([@oly_1])
      expect(Olympian.by_age(:DESC)).to eq([@oly_3])
    end

    it 'self.stats' do
      stats = Olympian.stats
      expect(stats[:total_competing_olympians]).to eq(3)
      expect(stats[:average_weight]).to eq({unit: "kg", male_olympians: 100.0, female_olympians: 100.0})
      expect(stats[:average_age]).to eq(30.0)
    end
  end
end
