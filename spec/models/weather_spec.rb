require 'rails_helper'

RSpec.describe Weather, type: :model do
  let(:weather) { create(:weather) }

  it 'requires temperature' do
    weather.temperature = nil
    expect(weather.valid?).to be_falsey
  end

  it 'accepts any temperature' do
    weather.temperature = 21
    expect(weather.valid?).to be_truthy
  end
end
