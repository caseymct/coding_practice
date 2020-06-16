def genomic_range(s, p, q)
  impact_factors = {'A': 1, 'C': 2, 'G': 3, 'T': 4}
  s_arr = s.chars
  
  m = p.length
  results = []

  occurrences = []

  (0..s_arr.length - 1).each do |i|
    if s_arr[i] == 'A'
      occurrences.push([1, 0, 0, 0])
    elsif s_arr[i] == 'C'
      occurrences.push([0, 1, 0, 0])
    elsif s_arr[i] == 'G'
      occurrences.push([0, 0, 1, 0])
    elsif s_arr[i] == 'T'
      occurrences.push([0, 0, 0, 1])
    end
  end

  (1..occurrences.length - 1).each do |i|
    (0..3).each {|j| occurrences[i][j] += occurrences[i-1][j] }
  end
  
  (0..(m-1)).each do |i|
    index1 = p[i]
    index2 = q[i]

    (0..3).each do |j|
      lower_index_count = 0
      if index1 - 1 >= 0
        lower_index_count = occurrences[index1 - 1][j]
      end
      if occurrences[index2][j] - lower_index_count > 0
        results[i] = j + 1
        break
      end
    end
  end
  
  return results
end

puts genomic_range("CAGCCTA", [2,5,0], [4,5,6]).to_s
puts genomic_range("CAGCCTA", [2,5,0], [4,5,6]).to_s
puts genomic_range("CAGCCTA", [2,5,0], [2,5,6]).to_s
puts genomic_range("CAGGGGGGGGGGGGGCCTA", [2,5,0], [2,5,16]).to_s

def count_div(a, b, k)
  
  count = 0
  (a..b).each do |i|
    if i % k == 0
      count += 1
    end
  end
  puts count
  mod = a % k
  denom = mod == 0 ? a : a - (a % k) + k
  return ((b - (b % k)) - denom)/k + 1
end

#puts count_div(6, 611, 6)
#puts count_div(6, 11, 2)
#puts count_div(1, 1, 1)
#puts count_div(1, 2, 11)
#puts count_div(11, 345, 17)
#puts count_div(11, 14, 2)

def min_avg_two_slice(a)
  prefixes = [a[0]]
  if a.length > 1
    (1..(a.length - 1)).each {|i| prefixes[i] = a[i] + prefixes[i - 1]}
  end
  min_avg = nil
  min_index = -1
  (0..(a.length - 1)).each do |p|
    ((p+1)..(a.length - 1)).each do |q|
      avg = (prefixes[q] - prefixes[p] + a[p])/(q - p + 1).to_f
      if min_avg.nil? or avg < min_avg
        min_avg = avg
        min_index = p
      end
    end
  end
  
  min_avg_brute = nil
  min_index_brute = -1
  (0..(a.length - 1)).each do |p|
    ((p+1)..(a.length - 1)).each do |q|
      avg = (a[p..q].inject(:+))/(q - p + 1).to_f
      if min_avg_brute.nil? or avg < min_avg_brute
        #puts "#{p} #{q} Min brute #{min_avg_brute} is less, setting to #{avg}"
        min_avg_brute = avg
        min_index_brute = p
      end
    end
  end
  puts min_index_brute
  return min_index
end

#puts min_avg_two_slice([4, 2, 2, 5, 1, 5, 8])
#puts min_avg_two_slice([2, 2])
#puts min_avg_two_slice([2, 2, -10, -14, 40, 1, 3])

def passing_cars(a)
  last_idx = a.length - 1
  prefix_sums = []
  prefix_sums[last_idx] = a[last_idx]
  (last_idx - 1).downto(0).each {|i| prefix_sums[i] = a[i] + prefix_sums[i+1] }
  
  n = 0
  (0..(last_idx-1)).each do |i|
    n += prefix_sums[i+1] if a[i] == 0
    
    break if n > 1000000000
  end
  
  return n > 1000000000 ? -1 : n
end

#puts passing_cars([0, 1, 0, 1, 1])
#puts passing_cars([0, 1, 1])