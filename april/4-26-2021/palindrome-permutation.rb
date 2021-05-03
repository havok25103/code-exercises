# Given a string, write a function to check if it is a
# permutation of a palindrome. A palindrome is a word
# or phrase that is the same forwards and backwards. A
# permutation is a rearrangement of letters. The palindrome
# does not need to be limited to just dictionary words.

# Example:
# Input: Tact Coa
# Output: True (permutation "taco cat", "atco cta", "etc.")

def is_palindrome? str
  return true if str.nil? || str.empty? || str.length == 1

  transformed_str = str.gsub(/\s+/, '').downcase

  char_map = {}
  odds = 0

  transformed_str.each_char do |char|
    char_map.has_key?(char) ?
      char_map[char] += 1 :
      char_map[char] = 1
  end

  char_map.each do |char, count|
    odds += 1 if count % 2 != 0 
  end

  odds == 0 || odds == 1
end