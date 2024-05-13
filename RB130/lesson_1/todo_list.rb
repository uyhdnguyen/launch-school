# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    self.title = title
    self.description = description
    self.done = false
  end

  def done?
    done
  end
  
  def done!
    self.done = true
  end
  
  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    begin
      self.todos << todo if todo.class == Todo
      raise TypeError unless todo.class == Todo
    rescue TypeError 
      puts "Can only add Todo objects"
    end

    todos
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    @todos << todo
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos.clone
  end

  def done?
    todos.all? { |todo| todo.done? }
  end

  def item_at(idx)
    todos.fetch(idx)
  end

  def mark_done_at(idx)
    todos.fetch(idx).done!
  end

  def mark_undone_at(idx)
    todos.fetch(idx).undone!
  end

  def done!
    todos.each { |todo| todo.done!}
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(idx)
    todos.fetch(idx)
    todos.delete_at(idx)
  end

  def to_s
    todos.each { |todo| puts todo }
    puts
  end

  def each
    todos.each { |todo| yield(todo) }
    self
  end

  def select
    list = TodoList.new(title)
    each { |todo| list.add(todo) if yield(todo)}

    list
  end

  def find_by_title(str)
    select { |todo| todo.title == str}.first
  end

  def all_done
    list = TodoList.new(title)

    each { |todo| list.add(todo) if todo.done?}

    list
  end

  def all_not_done
    list = TodoList.new(title)

    each { |todo| list.add(todo) unless todo.done?}

    list
  end

  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end

  protected

  attr_accessor :todos
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!
todo2.done!

results = list.all_done

puts results.inspect