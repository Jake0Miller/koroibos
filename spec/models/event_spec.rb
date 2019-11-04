require 'rails_helper'

RSpec.describe Event do
  describe 'Relationships' do
    it {should have_many :olympian_events}
    it {should have_many(:olympians).through(:olympian_events)}
  end

  describe 'Validations' do
    it {should validate_presence_of :event}
  end
end
