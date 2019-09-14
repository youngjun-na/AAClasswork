def bad_two_sum?(arr, target)             #O(n^2)
  (0...arr.length-1).each do |i|
    (i+1...arr.length).each do |j|
      return true if arr[i]+arr[j]==target
    end  
  end
  return false
end

def okay_two_sum?(arr, target)              #O(nlog(n))
  (0...arr.length-1).each do |i|
    difference = target - arr[i]
    return true if arr.bsearch {|n| n == difference}
  end
  return false
end

def two_sum?(arr, target)    #O(n)
  hash = {}
  arr.each {|el| hash[el] = 0}
  arr.each do |el|
    difference = target - el
    return true if hash.has_key?(difference)
  end
  return false
end