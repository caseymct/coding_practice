def max_counters(n, a)
  return 0 if n == 0

  counters = Array.new(n, 0)

  max_val = 0
  last_increase = 0

  a.each do |el|
    if el <= n
      counters[el - 1] = [counters[el - 1], last_increase].max
      counters[el - 1] += 1
      max_val = [max_val, counters[el - 1]].max
    else
      last_increase = max_val
    end
  end

  (0..(counters.length - 1)).each do |i|
    counters[i] = [counters[i], last_increase].max
  end

  return counters
end

#puts max_counters(5, [3, 4, 4, 6, 1, 4, 4]).to_s
#puts max_counters(1, [3, 4, 4, 6, 1, 4, 4]).to_s


def missing_integer(a)
  a.sort!
  a.select!{|i| i > 0}

  return 1 if a.length == 0 || a[0] > 1


  (0..(a.length - 2)).each do |i|
    return (a[i] + 1) if a[i+1] - a[i] > 1
  end
  return a[-1] + 1
end

puts missing_integer([1, 3, 6, 4, 1, 2])
puts missing_integer([-3, -1])
puts missing_integer([1, 2, 3])
puts missing_integer([2])
puts missing_integer([-2, 200])

def perm_check(a)
  a.sort!
  return 0 if a[0] > 1

  (0..(a.length - 2)).each do |i|
    return 0 if a[i+1] - a[i] != 1
  end
  return 1
end

#puts perm_check([3, 2, 4])
#puts perm_check([1, 3, 2, 4])
#puts perm_check([1, 2, 4])
#puts perm_check([4, 5, 10, 2, 7])
#puts perm_check([1, 2, 3, 5, 4])
#puts perm_check([1,1])