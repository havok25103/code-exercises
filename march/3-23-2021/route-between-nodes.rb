# Route Between Nodes
# 1. Given a directed graph, design an algorithm to find out whether there is a route between two nodes

class Node
  attr_accessor :children, :id, :visited

  def initialize(id)
    @children = []
    @id = id
    @visited = false
  end
end

class Graph
  attr_accessor :nodes

  def initialize(nodes)
    @nodes = nodes
  end

  def route_between_nodes?(start_node, end_node)
    return false if @nodes.empty?
    return true if start_node.id == end_node.id

    start_node.visited = true
    queue = Queue.new
    queue.enq start_node
    
    while !queue.empty? do
      node = queue.deq
      
      return true if node.id == end_node.id

      node.children.each do |child|
        if !child.visited
          child.visited = true
          queue.enq child
        end
      end
    end

    false
  end
end