require 'rails_helper'

RSpec.feature 'user logs in' do
  scenario 'using google oauth2' do
    visit root_path
    expect(page).to have_link('Sign in with Google')
    click_link 'Sign in with Google'
    expect(page).to have_content('ironman@gmail.com')
    expect(page).to have_link('Logout')
  end
end
