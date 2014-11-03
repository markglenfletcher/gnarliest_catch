FactoryGirl.define do
  factory :season do
    name "Season 1"
    start_date  Date.tomorrow
    end_date 1.week.from_now + 1.day
  end
end