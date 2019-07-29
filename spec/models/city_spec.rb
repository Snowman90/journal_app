require 'rails_helper'

RSpec.describe City, type: :model do
  let(:weather) { create(:weather) }
  let(:city) { create(:city, weather: weather) }

  it 'requires name' do
    city.name = nil
    expect(city.valid?).to be_falsey
  end

  it 'accepts any name' do
    city.name = 'Warszawa'
    expect(city.valid?).to be_truthy
  end
end
