module SeasonsHelper
  def duration(season)
    distance_of_time_in_words(season.start_date, season.end_date)
  end

  def start_date_for(season)
    season.start_date.to_formatted_s(:long_ordinal)
  end

  def time_until_start_of(season)
    distance_of_time_in_words_to_now(season.start_date)
  end
end
