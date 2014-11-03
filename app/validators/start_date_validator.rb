class StartDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << 'cannot be ealier than tomorrow' if value < Date.tomorrow
    record.errors[attribute] << 'cannot be later than end date' if value >= record.end_date
  end
end