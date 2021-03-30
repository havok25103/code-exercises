require_relative './linked-list-partition'

def test_values(result, values)
  current = result.head
  values.each do |x|
    expect(current.data).to eq x
    current = current.next
  end
end

def build_list(values)
  list = LinkedList.new
  values.each do |x|
    list.append x
  end
  list
end

describe LinkedListPartition do
  include LinkedListPartition

  describe 'partition_linked_list_brute_force' do
    it 'should return nil if there is no list' do
      result = partition_linked_list_brute_force 5, nil
      expect(result).to eq nil
    end

    it 'should give back the original list if there is no head' do
      list = LinkedList.new
      result = partition_linked_list_brute_force 5, list
      expect(result).to eq list
    end
    
    it 'should work for only a left partition' do
      list = build_list [ 3, 4, 1, -5, 0, 2, 1 ]
      result = partition_linked_list_brute_force 5, list      
      test_values result, [ 3, 4, 1, -5, 0, 2, 1 ]
    end

    it 'should work for only a right partition' do
      list = build_list [ 6, 5, 8, 5, 10, 12, 11 ]
      result = partition_linked_list_brute_force 5, list      
      test_values result, [ 6, 5, 8, 5, 10, 12, 11 ]
    end

    it 'should partition' do
      list = build_list [ 3, 5, 8, 5, 10, 2, 1 ]
      result = partition_linked_list_brute_force 5, list      
      test_values result, [ 3, 2, 1, 5, 8, 5, 10 ]
    end
  end

  describe 'partition_linked_list' do
    it 'should return nil if there is no list' do
      result = partition_linked_list 5, nil
      expect(result).to eq nil
    end

    it 'should give back the original list if there is no head' do
      list = LinkedList.new
      result = partition_linked_list 5, list
      expect(result).to eq list
    end
    
    it 'should work for only a left partition' do
      list = build_list [ 3, 4, 1, -5, 0, 2, 1 ]
      result = partition_linked_list 5, list      
      test_values result, [ 1, 2, 0, -5, 1, 4, 3 ]
    end

    it 'should work for only a right partition' do
      list = build_list [ 6, 5, 8, 5, 10, 12, 11 ]
      result = partition_linked_list 5, list      
      test_values result, [ 6, 5, 8, 5, 10, 12, 11 ]
    end

    it 'should partition' do
      list = build_list [ 3, 5, 8, 5, 10, 2, 1 ]
      result = partition_linked_list 5, list      
      test_values result, [ 1, 2, 3, 5, 8, 5, 10 ]
    end
  end
end