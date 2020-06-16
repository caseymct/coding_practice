def disc_intersect(a)
  intersections = 0
  x = []
  (0..(a.length - 1)).each{ |i| x.push([i - a[i], i + a[i]]) }
  x.sort!{|a, b| a[0] <=> b[0]}

  (0..(a.length - 2)).each do |i|
    x_min = x[i][0]
    x_max = x[i][1]
    ((i+1)..(a.length - 1)).each do |j|
      x2_min = x[j][0]
      x2_max = x[j][1]
      if x2_min > x_max or x2_max < x_min
        break
      end
      intersections += 1
      
      return -1 if intersections > 10000000
    end
  end
  
  return intersections
end

#puts disc_intersect([1, 5, 2, 1, 4, 0])
#puts disc_intersect([1, 0, 1, 0, 1])


def triangle(a)
  a.sort!
  
  (a.length - 1).downto(2).each do |i|
    return 1 if a[i-1] + a[i-2] > a[i]
  end
  return 0
end

puts triangle([10, 2, 5, 1, 8, 20])
puts triangle([10, 50, 5, 1])