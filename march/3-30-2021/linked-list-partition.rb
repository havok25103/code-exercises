# Write code to partition a linked list around value X,
# such that all nodes less than x, come before all nodes
# greater than or equal to x. If x is contained within
# the list, it can exist anywhere in the right partition.
# It cannot be in the left partition and does not need to
# exist between the left and right partitions.

class LinkedListNode
  attr_accessor :data, :next
  
  def initialize(data)
    @data = data
  end
end

class LinkedList
  attr_accessor :head, :tail

  def append(data)
    node = LinkedListNode.new data

    if !@head && !@tail
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  def prepend(data)
    node = LinkedListNode.new data

    if !@head && !@tail
      @head = node
      @tail = node
    else
      node.next = @head
      @head = node
    end
  end
end

module LinkedListPartition
  def partition_linked_list_brute_force(x, list)
    return if !list
    return list if !list.head

    left_partition = LinkedList.new
    right_partition = LinkedList.new

    current = list.head
    while current do
      current.data >= x ? right_partition.append(current.data) : left_partition.append(current.data)
      current = current.next
    end

    return left_partition if !right_partition.head
    return right_partition if !left_partition.head
    left_partition.tail.next = right_partition.head
    left_partition
  end

  def partition_linked_list(x, list)
    return if !list
    return list if !list.head
    new_list = LinkedList.new
    current = list.head
    while current do
      current.data >= x ? new_list.append(current.data) : new_list.prepend(current.data)
      current = current.next
    end
    new_list
  end
end