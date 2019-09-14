def first_anagrams?(str1, str2)          #O(n!)
  viable = str1.chars.permutation.to_a
  viable.map! {|sub| sub.join("")}
  viable.include?(str2)
end

def second_anagrams?(str1, str2)            #O(n^2)
  str2 = str2.chars
  str1.each_char do |char|
    index = str2.index(char) 
    return false if index.nil?
    str2.delete_at(index)
  end
  return true if str2.empty?
  return false
end


def third_anagrams?(str1, str2)             #O(nlogn)
  str1.chars.sort == str2.chars.sort
end


def fourth_anagrams?(str1, str2)          # O(n)
  hash1 = Hash.new(0)
  # hash2 = Hash.new(0)
  str1.chars.each {|char| hash1[char]+= 1}
  # str2.chars.each {|char| hash2[char]+=1}
  # hash1 == hash2

  str2.chars.each {|char| hash1[char]-= 1}
  hash1.values.all? {|value| value == 0}
end