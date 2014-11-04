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

feature 'User views a season' do
  scenario 'when the season exists' do
    season = create(:season)
    visit "/seasons/#{season.id}"
    expect(find('p.starts_when')).to have_content("This season starts tomorrow")
    expect(find('p.start_date')).to have_content("Start Date: #{season.start_date.to_formatted_s(:long_ordinal)}")
    expect(find('p.duration')).to have_content("Duration: 7 days")
  end

  scenario 'when the season does not exist' do
    visit '/seasons/123456'
    expect(current_path).to eq(seasons_path)
    expect(find('.notice')).to have_content("That season does not exist")
  end
end