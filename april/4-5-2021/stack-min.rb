# How would you design a stack which, in addition
# to push and pop, has a function min which returns
# the minimum element? Push, pop, and min should all
# opperate in O(1) time.

class ExampleStackNode
  attr_accessor :data, :next
  
  def initialize data
    @data = data
  end
end

class ExampleStack
  attr_accessor :top

  def peek
    return nil if !@top
    @top.data
  end

  def pop
    return nil if !@top
    item = @top.data
    @top = @top.next
    item
  end

  def push data
    top = ExampleStackNode.new data
    top.next = @top
    @top = top
  end
end

class ExampleStackWithMin < ExampleStack
  attr_accessor :mins, :top

  def initialize
    @mins = ExampleStack.new
  end

  def min
    return nil if !@top
    @mins.peek
  end

  def pop
    item = super
    @mins.pop if item != nil && item == @mins.peek
    item
  end

  def push data
    @mins.push data if !min || data <= min
    super
  end
end