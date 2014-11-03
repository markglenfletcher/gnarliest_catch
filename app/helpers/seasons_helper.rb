module SeasonsHelper
  def duration(season)
    distance_of_time_in_words(season.start_date, season.end_date)
  end

  def start_date_for(season)
    season.start_date.to_formatted_s(:long_ordinal)
  end
end
