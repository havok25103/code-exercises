# Implement a method to perform basic string compressions
# using the counts of  repeated characters. If the string
# would not become smaller than the original string, we
# should return the original string.
#
# Example: aabcccccaaa -> a2b1c5a3
#
# Constraints:
# - Assume only upper and lowercase letters (a-z)

module StringCompression
  def compress_string(str)
    return str if str == nil || str.empty?

    compressed_string = ''
    char_count = 0

    i = 0
    while i < str.length do
      char_count += 1
      if str[i] != str[i+1]
        compressed_string += "#{str[i].to_s}#{char_count}" 
        char_count = 0
      end
      i += 1
    end

    return str if compressed_string.length >= str.length
    compressed_string
  end
end