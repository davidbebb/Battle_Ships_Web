require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
    # fill_in 'name', :with => 'poohead'
    # click_button 'Submit'
  end

  scenario 'I did not enter my name' do
    visit '/new_game'
    click_button 'Submit'
    expect(page).to have_content "Please enter your name"
  end
end
