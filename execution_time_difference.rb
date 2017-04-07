require 'byebug'

def my_min1(array)
  smallest = false
  i = 0

  while i < array.length
    smallest = true
    j = 0
    while j < array.length
      if i == j
        j += 1
        next
      end
      smallest = false if array[j] < array[i]

      j += 1
    end

    return array[i] if smallest
    i += 1
  end
end

def my_min2(array)
  min = array.first
  array.drop(1).each do |ele|
    min = ele if ele < min
  end
  min
end

def largest1(array)
  all_subs = []
  i = 0
  while i < array.length - 1
    j = i + 1
    while j < array.length
      all_subs << array[i..j]
      j += 1
    end
    i += 1
  end
  all_subs.map { |sub| sub.inject(:+) }.max
end

list = [2, 3, -6, 7, -6, 7]
list2 = [*(0..999)].shuffle
list3 = [*(0..100)].shuffle
def largest2(array)
  highest = array.first
  current = array.first
  array.each_with_index do |el, idx|
    next if idx == 0
    if el + current > el
      current += el
    else #el + current < el
      current = el
    end
    highest = current if current > highest
  end
  highest
end

puts largest2(list)
puts "Slow"
puts largest1(list2)
puts largest1(list3)
puts "fast"
puts largest2(list2)
puts largest2(list3)
