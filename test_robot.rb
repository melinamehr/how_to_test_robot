require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    robot = Robot.new
    robot.foreign_model = true
    robot.needs_repairs = true
      assert_equal 1, robot.station
      #assert @robot.station == 1
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    robot = Robot.new
    robot.vintage_model = true
    robot.needs_repairs = true
    assert_equal 2, robot.station
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    robot = Robot.new
    robot.needs_repairs = true
    assert_equal 3, robot.station
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    robot = Robot.new
    assert_equal 4, robot.station
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    robot = Robot.new
    robot.todos = []
    assert_equal -1, robot.prioritize_tasks
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    robot = Robot.new
    robot.todos = [2,3,1]
    assert robot.prioritize_tasks == 3
  end

  def test_workday_on_day_off_returns_false
    robot = Robot.new
    robot.day_off = 2
    refute robot.workday?(2)
  end

  def test_workday_not_day_off_returns_true
    robot = Robot.new
    robot.day_off = "Monday"
    assert robot.workday?("Tuesday")

  end

end
