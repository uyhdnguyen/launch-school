=begin
 PROBLEM
 -------
  - program that manages robot factory settings
  - robots come off the factory floor -> no name
  - first time botting -> random name is created
  - reset robot -> name is wiped
  - next time ask after rebooted -> new random name is created
  - name should not follow predictabe sequence -> do not use the same name twice
  - RX837, BC811

EXAMPLES/ TEST CASES
--------------------
  - 
=end

class Robot
  @@names = []

  def name
    return @name if @name

    while @@names.include?(@name) || @name.nil?
      @name = generate_name
    end
    
    @@names << @name
    
    @name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  def generate_name
    name = ""
    2.times { name << rand(65..90).chr}
    3.times { name << rand(0..9).to_s }
    name
  end
end

require 'minitest/autorun'
# require_relative 'robot_name'
require 'minitest/reporters'
Minitest::Reporters.use!

class RobotTest < Minitest::Test
  DIFFERENT_ROBOT_NAME_SEED = 1234
  SAME_INITIAL_ROBOT_NAME_SEED = 1000

  NAME_REGEXP = /^[A-Z]{2}\d{3}$/

  def test_has_name
    assert_match NAME_REGEXP, Robot.new.name
  end

  def test_name_sticks
    # skip
    robot = Robot.new
    robot.name
    assert_equal robot.name, robot.name
  end

  def test_different_robots_have_different_names
    # skip
    Kernel.srand DIFFERENT_ROBOT_NAME_SEED
    refute_equal Robot.new.name, Robot.new.name
  end

  def test_reset_name
    # skip
    Kernel.srand DIFFERENT_ROBOT_NAME_SEED
    robot = Robot.new
    name = robot.name
    robot.reset
    name2 = robot.name
    refute_equal name, name2
    assert_match NAME_REGEXP, name2
  end

  def test_different_name_when_chosen_name_is_taken
    # skip
    Kernel.srand SAME_INITIAL_ROBOT_NAME_SEED
    name1 = Robot.new.name
    Kernel.srand SAME_INITIAL_ROBOT_NAME_SEED
    name2 = Robot.new.name
    refute_equal name1, name2
  end
end