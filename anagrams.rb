def first_anagram?(str1, str2)
  all_perms  = str1.chars.permutation.to_a
  all_perms.map(&:join).include?(str2)
end

# p first_anagram?("abc", "sally")

def second_anagram?(str1, str2)
  str1arr = str1.chars
  str2arr = str2.chars
  until str1arr.empty?
    first = str1arr[0]
    str2arr.delete_at(str2arr.find_index(first)) if str2arr.find_index(first)
    str1arr.shift
  end
  str1arr.empty? && str2arr.empty?
end

def third_anagram?(str1, str2)
  str1.split("") == str2.split("") #uses quicksort
end

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str1.chars.each do |char|
    hash1[char] += 1
  end

  str2.chars.each do |char|
    hash2[char] += 1
  end

  hash1 == hash2
end

p fourth_anagram?("elvis", "lives")
