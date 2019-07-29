require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates or updates itself from an oauth hash' do
    User.update_or_create(auth)
    new_user = User.first

    expect(new_user.provider).to eq('google_oauth2')
    expect(new_user.uid).to eq('111111111111111111111')
    expect(new_user.email).to eq('ironman@gmail.com')
    expect(new_user.first_name).to eq('Tony')
    expect(new_user.last_name).to eq('Stark')
  end
end
