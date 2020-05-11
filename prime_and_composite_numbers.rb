def min_perim(n)
  return 0 if n == 0
  return 4 if n == 1
  
  min_perimeter = n*n
  mid = Math.sqrt(n).floor
  (1..mid).each do |i|
    if n % i == 0
      b = n/i
      min_perimeter = [2 * (i + b), min_perimeter].min
    end
  end
  return min_perimeter
end

#puts min_perim(30)
#puts min_perim(7088907655)

def has_peak?(a)
  n = a.length
  (1..(n-2)).each do |i|
    return true if a[i-1] < a[i] and a[i+1] < a[i]
  end
  return false
end

def find_factors(n)
  factors = []
  mid = Math.sqrt(n).floor
  (2..mid).each do |i|
    if n % i == 0
      factors.push(i)
      factors.push(n/i) if n/i != i
    end
  end
  factors.sort.reverse
end

def peaks(a)
  n = a.length
  
  factors = find_factors(n)

  factors.each do |factor|
    i = n/factor
    has_all_peaks = true
    (0..(n-1)).step(i) do |j|
      start_idx = [j - 1, 0].max
      end_idx = [j + i, n - 1].min
      if !has_peak?(a[start_idx..end_idx])
        has_all_peaks = false
        break
      end
    end
    return factor if has_all_peaks
  end
  return has_peak?(a) ? 1 : 0
end

#puts peaks([1, 2, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2])
#puts peaks([1, 2, 2, 1, 3, 4, 1, 2, 3, 4, 6, 2])
#puts peaks([1, 1])
puts peaks([1, 3, 2, 1])