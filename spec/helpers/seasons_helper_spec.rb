require 'rails_helper'

RSpec.describe SeasonsHelper, :type => :helper do
  let(:season_one) { build_stubbed(:season) }
  let(:season_two) { build_stubbed(:season, start_date: Date.new(2014,7,1), end_date: Date.new(2014,8,1)) }

  it 'should report the correct duration' do
    expect(duration(season_one)).to eq("7 days")
    expect(duration(season_two)).to eq("about 1 month")
  end

  it 'should provide a readable string for the date' do
    expect(start_date_for(season_two)).to eq("July 1st, 2014")
  end
end
