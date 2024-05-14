require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todo_list'

class TodoListTest < Minitest::Test
  attr_accessor :list, :todo1, :todo2, :todo3, :todos

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_size
    assert_equal(3, list.size)
  end

  def test_first
    assert_equal(todo1, list.first)
  end

  def test_last
    assert_equal(todo3, list.last)
  end

  def test_shift
    todo = list.shift
    
    assert_equal(todo1, todo)
    assert_equal([todo2, todo3], list.to_a)
  end
  
  def test_pop
    todo = list.pop
    
    assert_equal(todo3, todo)
    assert_equal([todo1, todo2], list.to_a)
  end
  
  def test_done_question
    assert_equal(false, list.done?)
  end
  
  def test_type_error
    assert_raises(TypeError) {list.add("hi")}
    assert_raises(TypeError) {list.add(1)}
  end
  
  def test_shovel
    new_todo = Todo.new("Walk the dog")
    list << new_todo
    todos << new_todo
    
    assert_equal(todos, list.to_a)
  end
  
  def test_add_alias
    new_todo = Todo.new("Take a shower")
    list.add new_todo
    todos << new_todo
    
    assert_equal(todos, list.to_a)
  end
  
  def test_item_at
    assert_raises(IndexError) { list.item_at(100) }
    assert_equal(@todo1, list.item_at(0))
    assert_equal(@todo2, list.item_at(1))
  end

  def test_mark_undone_at
    assert_raises(IndexError) { list.mark_undone_at(100)}
    list.mark_undone_at(0)
    assert_equal(false,todo1.done?)
    assert_equal(false,todo2.done?)
    assert_equal(false,todo3.done?)
  end

  def test_done
    todo1.undone!
    todo2.undone!
    todo2.undone!

    assert_equal(false, list.done?)
  end

  def test_done_bang
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end
end



