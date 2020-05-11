def palindrome_permutation(s)
  sorted = s.chars.sort
  counts = {}
  seen_odd = false
  curr_char = sorted[0]
  (0..(sorted.length - 1)).each do |i|
    char = sorted[i]
    counts[char] ||= 0
    counts[char] += 1
    if char != curr_char || i == sorted.length - 1
      if counts[curr_char] % 2 == 1
        if seen_odd
          return false
        else
          seen_odd = true
        end
      end
      curr_char = char
    end
  end
  return counts.values.any?{|val| val % 2 == 1 }
  #return counts.values.select{|val| val % 2 == 1 }.length == 1
end

#puts palindrome_permutation("abcddbca")
#puts palindrome_permutation("abccdddbcccca")
puts palindrome_permutation("abccddbccccaz")