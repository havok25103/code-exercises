require_relative './stack-min'

describe ExampleStack do
  describe 'min' do
    it 'should return min' do
      stack = ExampleStackWithMin.new
      stack.push 100
      stack.push 8
      stack.push 50
      stack.push 3
      stack.push 20

      expect(stack.min).to eq 3

      stack.pop
      stack.pop

      expect(stack.min).to eq 8

      stack.pop
      stack.pop

      expect(stack.min).to eq 100

      stack.pop

      expect(stack.min).to eq nil
    end

    it 'should return nil if there is no min' do
      stack = ExampleStackWithMin.new
      value = stack.min
      expect(value).to eq nil
    end
  end

  describe 'peek' do
    it 'should peek' do
      stack = ExampleStackWithMin.new
      stack.push 5
      expect(stack.peek).to eq 5
    end

    it 'should peek for an empty stack' do
      stack = ExampleStack.new
      expect(stack.peek).to eq nil
    end
  end

  describe 'pop' do
    it 'should pop' do
      stack = ExampleStackWithMin.new
      stack.push 5
      value = stack.pop
      expect(stack.top).to eq nil
      expect(value).to eq 5
    end

    it 'should pop with an empty stack' do
      stack = ExampleStackWithMin.new
      value = stack.pop
      expect(stack.top).to eq nil
      expect(value).to eq nil
    end
  end

  describe 'push' do
    it 'should push' do
      stack = ExampleStackWithMin.new
      stack.push 5
      expect(stack.peek).to eq 5
    end
  end
end