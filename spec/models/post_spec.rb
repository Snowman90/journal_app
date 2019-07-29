require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:user) { create(:user) }
  let(:weather) { create(:weather) }
  let(:city) { create(:city, weather: weather) }
  let(:post) { create(:post, city: city, user: user) }

  it 'requires note' do
    post.note = nil
    expect(post.valid?).to be_falsey
  end

  it 'accepts note shorten that 140' do
    post.note = 'That was fun'
    expect(post.valid?).to be_truthy
  end

  it 'complains about too long note' do
    post.note = 'a' * 141
    expect(post.valid?).to be_falsey
  end
end
