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

def max_slice_sum(a)
  n = a.length - 1
  result = nil

  (0..n).each do |p|
    sum = 0

    (p..n).each do |q|
      sum += a[q]
      result = result.nil? ? sum : [result, sum].max
    end
  end
  result
end

puts max_slice_sum([3, 2, -6, 4, 0])
puts max_slice_sum([3, 2, -6, 4, 10])
puts max_slice_sum([-10])
