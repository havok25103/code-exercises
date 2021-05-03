require_relative './palindrome-permutation'

describe 'is_palindrome?' do
  it 'should return true for nil' do
    expect(is_palindrome?(nil)).to eq true
  end

  it 'should return true for empty string' do
    expect(is_palindrome?('')).to eq true
  end

  it 'should return true for q single character string' do
    expect(is_palindrome?('a')).to eq true
  end
  
  it 'should detect a palindrome' do
    expect(is_palindrome?('Tact Coa')).to eq true
  end
end