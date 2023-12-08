# The time of day can be represented as the number of minutes before or after
# midnight. If the number of minutes is positive, the time is after midnight.
# If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns
# the time of day in 24 hour format (hh:mm). Your method should work with any
# integer input.

# You may not use ruby's Date and Time classes.

# def time_of_day(minutes)
#   if (0..1440).include?(minutes)
#     time = minutes.divmod(60)
#     hour = sprintf('%.2d',time[0])
#     minute = sprintf('%.2d',time[1])
#     "#{hour}:#{minute}"
#   else
#     time = minutes.divmod(60)
#     hour = sprintf('%.2d',time[0] % 24)
#     minute = sprintf('%.2d',time[1])
#     "#{hour}:#{minute}"
#   end
# end

# p time_of_day(0)
# p time_of_day(-3)
# p time_of_day(35)
# p time_of_day(-1437)
# p time_of_day(3000)
# p time_of_day(800)
# p time_of_day(-4231)

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = * MINUTES_PER_HOUR

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0
    minutes += MINUTES_PER_DAY
  end

  minutes % MINUTES_PER_DAY
end

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

time_of_day(3000)