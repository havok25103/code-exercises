require_relative './all-unique-characters.rb'

describe HasAllUniqueChars do
  include HasAllUniqueChars

  nil_string = nil
  empty_string = ''
  single_char_string = 'a'
  unique_char_string = 'pdwe7rtsc,!=z'
  not_unique_char_string = 'ooppasdc,jh8u!881!c'

  it 'should be true for nil' do
    result_a = has_all_unique_chars nil_string
    result_b = has_all_unique_chars_no_data_structures nil_string
    expect(result_a).to eq true
    expect(result_b).to eq true
  end

  it 'should be true for empty string' do
    result_a = has_all_unique_chars empty_string
    result_b = has_all_unique_chars_no_data_structures empty_string
    expect(result_a).to eq true
    expect(result_b).to eq true
  end

  it 'should be true for single character strings' do
    result_a = has_all_unique_chars single_char_string
    result_b = has_all_unique_chars_no_data_structures single_char_string
    expect(result_a).to eq true
    expect(result_b).to eq true
  end

  it 'should be true for a string with unique characters' do
    result_a = has_all_unique_chars unique_char_string
    result_b = has_all_unique_chars_no_data_structures unique_char_string
    expect(result_a).to eq true
    expect(result_b).to eq true
  end

  it 'should be false for a string without unique characters' do
    result_a = has_all_unique_chars not_unique_char_string
    result_b = has_all_unique_chars_no_data_structures not_unique_char_string
    expect(result_a).to eq false
    expect(result_b).to eq false
  end
end