#!/bin/ruby

def rotate(a, k)
    return a if a.length == 0
    (0..k-1).each { a.unshift(a.pop()) }
    return a
end

#rotate([3, 8, 9, 7, 6], 3)
#

def odd_out(a)
    return nil if a.length == 0

    d = {}
    a.each do |el|
        d[el] ||= 0
        d[el] += 1
    end
    ind = d.values.index{ |el| el % 2 == 1 }
    return d.keys[ind]
end

#puts solution ([9, 3, 9, 3, 9, 7, 9])
#puts solution([])

def missing_int(a)
    a.sort!
    return 1 if a.length == 0 || a[0] != 1
    n_plus_one = a.length + 1
    return n_plus_one if a[-1] != n_plus_one

    len = a.length - 2
    missing_val = nil
    (0..len).each do |i|
        if (a[i + 1] - a[i]) > 1
            missing_val = a[i] + 1
            break
        end
    end
    return missing_val || n_plus_one
end

#puts missing_int([2, 3, 1, 5])
##puts missing_int([])
##puts missing_int([2, 1])
def sum(a)
    return a.length == 0 ? 0 : a.inject(:+)
end

def minimize_tape(a)
    diffs = []

    len = a.length - 2
    sum_left = 0
    sum_right = sum(a)

    (0..len).each do |p|
        sum_left += a[p]
        sum_right -= a[p]
        diffs.push((sum_left - sum_right).abs)
    end
    return diffs.length > 0 ? diffs.min : 0
end

#puts minimize_tape([3, 1, 2, 4, 3])
#puts minimize_tape([])

def divisible_by(a, b, k)
    a = k if a < k

    x = ((b-a)/k)
    x += 1 if a % k == 0

    #n = 0
    #(a..b).each do |i|
    #    n += 1 if i % k == 0
    #end
    return x
end

#puts divisible_by(6, 11, 2)
#puts divisible_by(6, 6, 4)
#puts divisible_by(11, 345, 17)

def frog_jump(x, a)
    d = {}
    (1..x).each {|i| d[i] = true }

    min_time = -1
    len = a.length - 1

    (0..len).each do |sec|
        n = a[sec]
        d.delete(n) if d[n]
        if d.length == 0
            min_time = sec
            break
        end
    end

    return min_time
end

#puts frog_jump(5, [1, 3, 1, 4, 2, 3, 5, 4])
#puts frog_jump(6, [1, 3, 1, 4, 2, 3, 5, 4])
#puts frog_jump(1, [1, 3, 1, 4, 2, 3, 5, 4])

def mult(a)
    return a.length == 0 ? 0 : a.inject(:*)
end

def maximize_product(a)
    a.sort!
    n = a.length
    prod_1 = mult(a[(n - 3)..-1])
    prod_2 = mult([a[0], a[1], a[-1]])
    return [prod_1, prod_2].max
end

def brackets(s)
    pairs = {'{': '}', '(':')', '[': ']'}
    open_chars = pairs.keys.map(&:to_s)
    closing_chars = pairs.values.map(&:to_s)
    most_recent_open_char = nil
    failed = false
    stack = []

    s.split('').each do |char|
        if open_chars.include?(char)
            stack.push(char)
            most_recent_open_char = char
        elsif closing_chars.include?(char)
            if most_recent_open_char.nil? || char != pairs[most_recent_open_char.to_sym]
                failed = true
                break
            else
                stack.pop()
                most_recent_open_char = stack[-1]
            end
        end
    end

    return failed || stack.length > 0 ? 0 : 1
end

#puts brackets("[{}{}]")
#puts brackets("[{}{)]")
#puts brackets("")
#puts brackets(")[]")
#puts brackets("}[()]")
#puts brackets("[(((){}))]")

def dominator(a)
    len = a.length
    return -1 if len == 0 || len == 2
    return 0 if len == 1

    n = len/2
    h = Hash.new(0)
    a.each { | v | h.store(v, h[v]+1) }
    max_occur = h.values.max
    if max_occur > n
        return a.index(h.key(max_occur))
    else
        return -1
    end
end

#puts dominator([3, 2, 3, 4, 3, 3, 3, -1])
#puts dominator([3, 2, 3, 4, 3, 1, 3, -1])
#puts dominator([5, 2, 2, 2, 3, 2, 3, 2])
#puts dominator([])
#puts dominator([3, 1, 1])

def max_slice(a)
    n = a.length
    k1 = Array.new(n, 0)
    k2 = Array.new(n, 0)

    (1..(n-1)).each {|i| k1[i] = [k1[i-1] + a[i], 0].max }

    i = n - 2
    while i > 0 do
        k2[i] = [k2[i+1]+a[i], 0].max
        i -= 1
    end

    max_val = 0
    (1..(n-2)).each do |i|
        max_val = [max_val, k1[i-1] + k2[i + 1]].max
    end

    return max_val
end

def flags(a)
    peaks_indices = []

    (1..(a.length - 2)).each do |i|
        peaks_indices.push(i) if a[i-1] < a[i] && a[i+1] < a[i]
    end

    k = 3 #peaks_indices.length
    flags = [0]
    start_index = 0
    puts peaks_indices.to_s
    has_more_flags = true

    while start_index < k and has_more_flags do
        puts "Start index #{start_index}"
        found_flag = false
        ((start_index + 1)..(k-1)).each do |i|
            puts "i #{i} Checking if #{peaks_indices[i]} and #{peaks_indices[start_index]} >= #{k}"
            if (peaks_indices[i] - peaks_indices[start_index]) >= k
                flags.push(i)
                found_flag = true
                puts "Adding to flags and start_index is now #{i}"
                start_index = i
                break
            end
        end
        unless found_flag
            puts "no more flags"
            has_more_flags = false
        end
    end

    puts flags.to_s
end

puts flags([1, 5, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2])