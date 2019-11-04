require 'rails_helper'

RSpec.describe OlympianEvent do
  describe 'Relationships' do
    it {should belong_to :olympian}
    it {should belong_to :event}
  end

  describe 'Validations' do
    it {should validate_presence_of :medal}
  end
end
