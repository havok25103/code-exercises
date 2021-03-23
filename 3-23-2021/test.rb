require_relative './route-between-nodes.rb'

describe Graph do
  it 'should be false if we have no nodes' do
    node_a = Node.new 'a'
    node_b = Node.new 'b'
    graph = Graph.new []
    result = graph.route_between_nodes? node_a, node_b
    expect(result).to eq false
  end

  it 'should be true if our start and end nodes are the same' do
    node = Node.new 'a'
    graph = Graph.new [node]
    result = graph.route_between_nodes? node, node
    expect(result).to eq true
  end

  it 'should find a route between two nodes' do
    node_a = Node.new 'a'
    node_b = Node.new 'b'
    node_c = Node.new 'c'
    node_d = Node.new 'd'
    node_e = Node.new 'e'

    node_a.children = [node_b]
    node_b.children = [node_c, node_d]
    node_d.children = [node_e]

    graph = Graph.new([
      node_a,
      node_b,
      node_c,
      node_d,
      node_e
    ])

    result = graph.route_between_nodes? node_a, node_e

    expect(result).to eq true
  end

  it 'should find a route between two nodes in a circular graph' do
    node_a = Node.new 'a'
    node_b = Node.new 'b'
    node_c = Node.new 'c'

    node_a.children = [node_b]
    node_b.children = [node_c]
    node_c.children = [node_a]

    graph = Graph.new([
      node_a,
      node_b,
      node_c
    ])

    result = graph.route_between_nodes? node_a, node_c

    expect(result).to eq true
  end
  
  it 'should not find a route between two nodes' do
    node_a = Node.new 'a'
    node_b = Node.new 'b'
    node_c = Node.new 'c'
    node_d = Node.new 'd'
    node_e = Node.new 'e'

    node_a.children = [node_c]
    node_b.children = [node_c, node_e]
    node_c.children = [node_d]

    graph = Graph.new([
      node_a,
      node_b,
      node_c,
      node_d,
      node_e
    ])

    result = graph.route_between_nodes? node_a, node_b

    expect(result).to eq false
  end

  it 'should not find a route between two nodes in a circular graph' do
    node_a = Node.new 'a'
    node_b = Node.new 'b'
    node_c = Node.new 'c'
    node_d = Node.new 'd'
    
    node_a.children = [node_b]
    node_b.children = [node_c]
    node_c.children = [node_a]
    node_d.children = [node_b]

    graph = Graph.new([
      node_a,
      node_b,
      node_c,
      node_d
    ])

    result = graph.route_between_nodes? node_a, node_d

    expect(result).to eq false
  end
end