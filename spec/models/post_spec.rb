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

  it 'accepts note shorten or equal to 500' do
    post.note = 'a' * 500
    expect(post.valid?).to be_truthy
  end

  it 'complains about too long note' do
    post.note = 'a' * 501
    expect(post.valid?).to be_falsey
  end
end
