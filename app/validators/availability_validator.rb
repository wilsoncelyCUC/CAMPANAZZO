class AvailabilityValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    bookings = Reservation.where(["profile_id =?", record.profile_id])
    date_ranges = bookings.map { |b| b.start_date..b.end_date }

    date_ranges.each do |range|
      if range.include? value
        record.errors.add(attribute, "No disponible")
      end
    end
  end

end


# I have placed this class in app/validators. Here, record is the object being validated, attribute is either start_date or end_date and value is whatever is currently assigned to start_date and end_date. We find all of the bookings for the record, and then build a list of ranges of unavailable dates (date_ranges is an Array of Arrays). If the value is included in any of these ranges, we add an error to the attribute with the indication that the said date is “not available”.
