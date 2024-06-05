=begin
PROBLEM
-------
- create a clock that is independent of date
- ability to manipulate the time represented by given Clock object
  - add minutes to
  - subtract minutes from
  - Cannot mutate Clock object when add/subtract
  -> create a new Clock obj
- two clock obj that repressent the same time are ==
- cannot use built in date/ time funtionality

TEST CASES
----------
- assert_equal '08:00', Clock.at(8).to_s
  assert_equal '09:00', Clock.at(9).to_s

- assert_equal '11:09', Clock.at(11, 9).to_s

- clock = Clock.at(10) + 3
  assert_equal '10:03', clock.to_s

- old_clock = Clock.at(10)
  new_clock = old_clock + 3
  refute_same new_clock, old_clock

- clock = Clock.at(0) - 50
  assert_equal '23:10', clock.to_s

- old_clock = Clock.at(10)
  new_clock = old_clock - 50
  refute_same new_clock, old_clock

DATA STRUCTURES
---------------
- INPUT: integers that represent hours & minutes via `at` class method
- OUTPUT: 

- INTERMEDIATE: 

ALGORITHM
---------
- create class Clock
- create class method `at` that takes 2 arguments
  - one parameter is hour
  - one parameter is minute
- create `to_s` class method
- create class method `+`
- create class method `-`

=end

class Clock
  def initialize(hrs, min)
    @hrs = "%02d" % hrs
    @min = "%02d" % min
  end
  
  def self.at(hrs, min = 0)
    new(hrs, min)
    # "foo = %{foo}, baz = %{baz}" % {foo: 'bar', baz: 'bat'} # => "foo = bar, baz = bat"
    # "%{hrs}:%{min}" % {hrs: hrs, min: min}
  end

  def to_s
    "#{@hrs}:#{@min}"
  end

  def +(min)
    add_hrs,add_min = min.divmod(60)

    new_min = "%02d" % (@min.to_i + add_min)
    new_hrs = "%02d" % (@hrs.to_i + add_hrs)

    new_hrs = new_hrs == "24" ? "00" : new_hrs

    new_hrs = new_hrs.to_i > 24 ? (new_hrs.to_i % 24) : new_hrs

    Clock.new(new_hrs, new_min)
  end

  def -(min)
    sub_hrs,sub_min = min.divmod(60)

    if @hrs == "00"
      new_hrs = "%02d" % (24 - (1 + sub_hrs))
    else
      new_hrs = "%02d" % (@hrs.to_i - sub_hrs)
    end

    if @min == "00"
      new_min = "%02d" % (60 - sub_min)
    else
      new_min = "%02d" % (@min.to_i - sub_min)
    end

    Clock.new(new_hrs, new_min)
  end
end


require 'minitest/autorun'
# require_relative 'clock'
require 'minitest/reporters'
Minitest::Reporters.use!

class ClockTest < Minitest::Test
  def test_on_the_hour
    assert_equal '08:00', Clock.at(8).to_s
    assert_equal '09:00', Clock.at(9).to_s
  end

  def test_past_the_hour
    # skip
    assert_equal '11:09', Clock.at(11, 9).to_s
  end

  def test_add_a_few_minutes
    # skip
    clock = Clock.at(10) + 3
    assert_equal '10:03', clock.to_s
  end

  def test_adding_does_not_mutate
    # skip
    old_clock = Clock.at(10)
    new_clock = old_clock + 3
    refute_same new_clock, old_clock
  endfgd

  def test_subtract_fifty_minutes
    # skip
    clock = Clock.at(0) - 50
    assert_equal '23:10', clock.to_s
    
  end

  def test_subtracting_does_not_mutate
    # skip
    old_clock = Clock.at(10)
    new_clock = old_clock - 50
    refute_same new_clock, old_clock
  end

  def test_add_over_an_hour
    # skip
    clock = Clock.at(10) + 61
    assert_equal '11:01', clock.to_s
  end

  def test_wrap_around_at_midnight
    # skip
    clock = Clock.at(23, 30) + 60
    assert_equal '00:30', clock.to_s
  end

  def test_add_more_than_a_day
    # skip
    clock = Clock.at(10) + 3061
    assert_equal '13:01', clock.to_s
  end

  def test_subtract_a_few_minutes
    # skip
    clock = Clock.at(10, 30) - 5
    assert_equal '10:25', clock.to_s
  end

  def test_subtract_minutes
    skip
    clock = Clock.at(10) - 90
    assert_equal '08:30', clock.to_s
  end

  def test_wrap_around_at_negative_midnight
    skip
    clock = Clock.at(0, 30) - 60
    assert_equal '23:30', clock.to_s
  end

  def test_subtract_more_than_a_day
    skip
    clock = Clock.at(10) - 3061
    assert_equal '06:59', clock.to_s
  end

  def test_equivalent_clocks
    skip
    clock1 = Clock.at(15, 37)
    clock2 = Clock.at(15, 37)
    assert_equal clock1, clock2
  end

  def test_inequivalent_clocks
    skip
    clock1 = Clock.at(15, 37)
    clock2 = Clock.at(15, 36)
    clock3 = Clock.at(14, 37)
    refute_equal clock1, clock2
    refute_equal clock1, clock3
  end

  def test_wrap_around_backwards
    skip
    clock1 = Clock.at(0, 30) - 60
    clock2 = Clock.at(23, 30)
    assert_equal clock1, clock2
  end
end