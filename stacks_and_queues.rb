def fish(a, b)
  n = a.length - 1
  
  alive_count = 0
  i = 0
  while i <= n do
    if b[i] == 0
      alive_count += 1
      i += 1
      #puts "Fish #{i} stays alive, direction is upstream"
    else
      #puts "Fish #{i} swims downstream"
      stays_alive = true
      incr = 1
      (i+1..n).each do |j|
        if b[j] == 0
          #puts "Fish #{j} swims upstream"
          idx = a[j] < a[i] ? j : i
          #puts "Fish #{idx} is getting eaten"
          if idx == i
            stays_alive = false
            break
          end
          incr += 1
          #puts "Incrementing #{i} to #{i + incr}"
        end
      end
      if stays_alive
        #"Fish #{i} stayed alive"
        alive_count += 1
      end
      i += incr
    end
  end
  return alive_count
end

#puts fish([4, 3, 2, 1, 5], [0, 1, 0, 0, 0])
puts fish([4, 3, 2, 1, 5], [0, 0, 0, 1, 0])
