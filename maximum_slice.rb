def max_profit(a)
  max_calculated = 0
  min_num = a[0]
  
  (1..(a.length - 1)).each do |i|
    min_num = [min_num, a[i-1]].min
    max_calculated = [max_calculated, a[i] - min_num].max
  end
  
  return max_calculated
end

#puts max_profit([23171, 21011, 21123, 21366, 21013, 21367])
#puts max_profit([2000])
#puts max_profit([2000, 1999, 1800])

def sum(a)
  return a.length == 0 ? 0 : a.inject(:+)
end

def max_slice_sum(a)
  n = a.length
  len = n - 1
  initial_slices = []
  (1..len).each do |i|
    prev = i == 1 ? a[0] : initial_slices[i-2]
    initial_slices.push(prev + a[i])
  end
  
  max_sum = initial_slices.max
  return max_sum if n == 2

  (2..(n - 1)).each do |i|
    initial_slices.shift
    initial_slices = initial_slices.map{|j| j - a[i-2]}
    max_sum = [max_sum, initial_slices.max].max
  end
  
  return max_sum
end

puts max_slice_sum([3, 2, -6, 4, 0])
puts max_slice_sum([3, 2, -6, 4, 10])
