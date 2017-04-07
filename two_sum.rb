arr = [0, 1, 5, 7]

def bad_two_sum?(arr, target)

  i = 0
  while i < arr.length - 1
    j = i + 1
    while j < arr.length
      return true if arr[i] + arr[j] == target

      j += 1
    end

    i += 1
  end
  false
end

def okay_two_sum?(arr, target)
  sorted = arr.sort
  sorted.each_with_index do |el, idx|
    return true if bsearch(sorted - [el], target - el)
  end
  false
end

def bsearch(arr, target)
  return nil if arr.empty?
  mid_idx = arr.length / 2
  mid_ele = arr[mid_idx]
  return mid_idx if mid_ele == target
  if target < mid_ele
    bsearch(arr.take(mid_idx), target)
  else
    temp = bsearch(arr.drop(mid_idx + 1), target)
    return temp + 1 + mid_idx unless temp.nil?
  end
end

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def two_sum?(arr, target)
  hash = Hash.new { |h, k| h[k] = 0}
  arr.each do |el|
    hash[el] += 1
  end

  arr.each do |el|
    hash2 = hash.dup
    hash2[el] -= 1
    return true if hash2[target - el] > 0
  end
  false
end

p two_sum?(arr, 6)
p two_sum?(arr, 10)
