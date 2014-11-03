require 'rails_helper'

RSpec.describe Season, :type => :model do
  let(:attr) { attributes_for(:season) }
  let(:season) { Season.new(attr) }

  it 'should require name' do
    invalid_attr = attr.merge(name: nil)
    season_without_name = Season.new invalid_attr
    expect(season_without_name).to_not be_valid
  end

  it 'should require start_date' do
    invalid_attr = attr.merge(start_date: nil)
    season_without_start_date = Season.new invalid_attr
    expect(season_without_start_date).to_not be_valid
  end

  it 'should require end_date' do
    invalid_attr = attr.merge(end_date: nil)
    season_without_end_date = Season.new invalid_attr
    expect(season_without_end_date).to_not be_valid
  end

  it 'should disallow an empty name' do
    season.name = ''
    expect(season).to_not be_valid
  end

  it 'should disallow a start date of today' do
    season.start_date = Date.today
    expect(season).to_not be_valid
  end

  it 'should disallow a start date in the past' do
    season.start_date = Date.yesterday
    expect(season).to_not be_valid
  end

  it 'should disallow a end date in the past' do
    season.end_date = Date.yesterday
    expect(season).to_not be_valid
  end

  it 'should disallow a end date before start date' do
    season.start_date = 1.week.from_now
    season.end_date = Date.today
    expect(season).to_not be_valid
  end

  it 'should disallow a end date and start date that are the same' do
    season.start_date = 1.week.from_now
    season.end_date = season.start_date
    expect(season).to_not be_valid
  end
end
