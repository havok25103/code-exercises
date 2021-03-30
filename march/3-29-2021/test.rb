require_relative './string-compression'

describe StringCompression do
  include StringCompression

  it 'should return nil for nil' do
    expect(compress_string(nil)).to eq nil
  end

  it 'should return empty string for empty string' do
    expect(compress_string('')).to eq ''
  end

  it 'should retutn the original string if the compressed string is larger than the original' do
    expect(compress_string('abcde')).to eq 'abcde'
  end

  it 'should retutn a compressed string if the compressed string is smaller than the original' do
    expect(compress_string('aabcccccaaa')).to eq 'a2b1c5a3'
  end
end