require 'rails_helper'

RSpec.describe SeasonsHelper, :type => :helper do
  let(:season_one) { build_stubbed(:season) }

  it 'should report the correct duration' do
    expect(duration(season_one)).to eq("7 days")
  end

  it 'should provide a readable string for the date' do
    expect(start_date_for(season_one)).to eq(Date.tomorrow.to_formatted_s(:long_ordinal))
  end

  it 'should provide the a time until start' do
    expect(time_until_start_of(season_one)).to_not be_nil
  end
end
