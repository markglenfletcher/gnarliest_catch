require 'rails_helper'

feature 'User views seasons' do
  scenario 'when seasons are unavailable' do
    Season.destroy_all
    visit seasons_path
    expect(page).to have_content 'There are no seasons currently available.'
    expect(find_link('#new_season')).to have_content 'Create new Season'
  end

  scenario 'when seasons are available' do
    season = build(:season)
    visit seasons_path
    expect(page).to have_content "There are 1 seasons available."
    within('#seasons') do
      expect(page).to have_selector('.season', count: 1)
      expect(find(".season h1.name")).to have_content("Name: #{season.name}")
      expect(find(".season p.start_date")).to have_content("Start Date: #{season.start_date.to_formatted_s(:long_ordinal)}")
      expect(find(".season p.duration")).to have_content("Duration: 7 days")
    end
    expect(find_link('#new_season')).to have_content 'Create new Season'
  end
end