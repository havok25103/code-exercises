# Is Unique
# 1. Implement an algoritm to determine if a string has all unique characters.
# 2. What if you cannot use additional data structures?
#
# Restrictions
# - Use mostly language agnostic functionality
# - No ruby shortcuts
#
# Assumptions
# - Standards ASCII Character Set ( 256 characters )
# - Control and printable characters are both checked for redundancy

module HasAllUniqueChars
  # Runtime: O(N) N=str.length
  # Space: O(N) N=256
  def has_all_unique_chars (str)
    return true if !str || str.length < 2
    
    char_map = {}
    
    str.each_char do |char|
      return false if char_map.has_key? char
      char_map[char] = nil
    end
    
    true
  end

  # Runtime: O(N^2) N=str.length
  # Space: O(1)
  def has_all_unique_chars_no_data_structures(str)
    return true if !str || str.length < 2

    i = 0
    j = 0
    while i < str.length do
      while j < str.length do
        return false if i != j  && str[i] === str[j]
        j+=1
      end

      i+=1
    end

    true
  end
end
