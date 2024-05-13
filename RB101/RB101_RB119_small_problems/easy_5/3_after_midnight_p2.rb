# As seen in the previous exercise, the time of day can be represented as the
# number of minutes before or after midnight. If the number of minutes is
# positive, the time is after midnight. If the number of minutes is negative,
# the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return
# the number of minutes before and after midnight, respectively. Both methods
# should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.

# Examples:

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def convert_hour_format(string)
  string = string.chars
  string[0] + string[1]
end

def convert_minute_format(string)
  string = string.chars
  string[3] + string[4]
end

def after_midnight(string)
  hours = convert_hour_format(string).to_i
  minutes = convert_minute_format(string).to_i

  if hours == 24
    hours = 0
    hours * MINUTES_PER_HOUR + minutes
  else
    hours * MINUTES_PER_HOUR + minutes
  end
end

p after_midnight('00:00')
# p before_midnight('00:00')
p after_midnight('12:34')
# p before_midnight('12:34')
p after_midnight('24:00')
# p before_midnight('24:00')

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end