# You are given a one dimensional array that may contain both positive and negative integers, find the sum of contiguous subarray of numbers which has the largest sum.

# For example, if the given array is {-2, -5, 6, -2, -3, 1, 5, -6}, then the maximum subarray sum is 7 (see highlighted elements).

# The naive method is to run two loops. The outer loop picks the beginning element, the inner loop finds the maximum possible sum with first element picked by outer loop and compares this maximum with the overall maximum. Finally return the overall maximum. 
# The time complexity of the Naive method is O(n^2).

# Using Divide and Conquer approach, we can find the maximum subarray sum in O(nLogn) time. Following is the Divide and Conquer algorithm.


# 1) Divide the given array in two halves
# 2) Return the maximum of following three
# ….a) Maximum subarray sum in left half (Make a recursive call)
# ….b) Maximum subarray sum in right half (Make a recursive call)
# ….c) Maximum subarray sum such that the subarray crosses the midpoint

# The lines 2.a and 2.b are simple recursive calls. How to find maximum subarray sum such that the subarray crosses the midpoint?
# We can easily find the crossing sum in linear time. The idea is simple, find the maximum sum starting from mid point 
# and ending at some point on left of mid, then find the maximum sum starting from mid + 1 and ending with sum point on right of mid + 1. 
# Finally, combine the two and return. 



# // A Divide and Conquer based program for maximum subarray sum problem

def max_crossing_sum(arr, low, mid, high)
  sum, left_sum, i = 0, 0, mid
  while i >= low do
    sum = sum + arr[i]
    left_sum = sum if sum > left_sum
    i = i - 1
  end
  sum, i, right_sum = 0, mid+1, 0
  while i <= high do
    sum = sum + arr[i].to_i
    right_sum = sum if sum > right_sum
    i = i + 1
  end
  # // Return sum of elements on left and right of mid
  return left_sum + right_sum;
end

def max_sum_arrary_sum(arr, low, high)
  if low == high
    return arr[low]
  else
    mid = (low+high)/2
    return [max_sum_arrary_sum(arr, low, mid), max_sum_arrary_sum(arr, mid+1, high), max_crossing_sum(arr, low, mid, high)].compact.max
  end
end


# sample input to test functionality
arr = [-2, -5, 6, -2, -3, 1, 5, -6]
low, high = 0, arr.length - 1
puts max_sum_arrary_sum(arr, low, high)
