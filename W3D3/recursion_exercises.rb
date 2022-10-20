# Warm Up
# [1, 2, 3, 4]
def range(start, finish)
    return [] if start == finish 
    return [start] + range(start + 1, finish)
end
# p range(0, 5)

# p range(3, 8)

# p range(4, 10)

# p range(69, 420)

#Exponentiation

def exponent_recursion_1(b, n)
    return 1 if n == 0
    return b if n == 1

    b * exponent_recursion_1(b, n - 1)

end

def exponent_recursion_2(b, n)
    return 1 if n == 0
    return b if n == 1

    if n % 2 == 0
        exponent_recursion_2(b, n / 2) * exponent_recursion_2(b, n / 2)
    else
        b * (exponent_recursion_2(b, (n - 1) / 2) * exponent_recursion_2(b, (n - 1) / 2))
    end

end

# p exponent_recursion_1(1, 0)
# p exponent_recursion_1(1, 1)
# p exponent_recursion_1(1, 2)
# p exponent_recursion_1(2, 0)
# p exponent_recursion_1(2, 1)
# p exponent_recursion_1(2, 3)


#  p exponent_recursion_2(1, 0)
#  p exponent_recursion_2(1, 1)
#  p exponent_recursion_2(1, 2)
#  p exponent_recursion_2(2, 0)
#  p exponent_recursion_2(2, 1)
#  p exponent_recursion_2(2, 3)

#Deep dup

class Array
    def deep_dup
        return [] if self.empty?
        return self if self.all?{|i| !i.is_a?(Array)}
        res = []
        self.each do |i|

            if !i.is_a?(Array)
                res += i   
            else
                res += [i.deep_dup]
            end
        end
        res
    end 
end

robot_parts = [
    ["nuts", "bolts", "washers"],
    ["capacitors", "resistors", "inductors"]
  ]
  
#p robot_parts_copy = robot_parts.dup
#r_copy = robot_parts.deep_dup
#   # shouldn't modify robot_parts
#p robot_parts_copy[1] << "LEDs"
#   # but it does
#p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

#p r_copy

#Fibonacci

def fibbonaci(n)
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2

    fibs = fibbonaci(n - 1)
    fibs << fibs[-1] + fibs[-2]
end

def fibbonaci_itr(n)
    res = [0, 1]

    return [] if n == 0
    return [0] if n == 1
    return res if n == 2

    (2...n).each do |i|
        res << res[i - 1] + res[i - 2]
    end

    res
end

# p fibbonaci(0)
# p fibbonaci(1)
# p fibbonaci(2)
# p fibbonaci(3)
# p fibbonaci(4)
# p fibbonaci(5)


# p fibbonaci_itr(0)
# p fibbonaci_itr(1)
# p fibbonaci_itr(2)
# p fibbonaci_itr(3)
# p fibbonaci_itr(4)
# p fibbonaci_itr(5)


#Binary Search

#def bsearch(array, target)
#    return array if array.length == 1
#    # return 0 if array[0] == target
#    # return array.length - 1 if array[array.length - 1] == target
#    # return nil if !array.include?(target)
#    if array[(array.length - 1) / 2] > target
#        left_side = []
#        (0...((array.length - 1) / 2)).each {|i| left_side << array[i]}
#        bsearch(left_side, target)
#    elsif array[(array.length - 1) / 2] < target
#        right_side = []
#        (((array.length - 1)/2)..array.length - 1).each {|i| right_side << array[i]}
#        bsearch(right_side, target)
#    else
#        (array.length - 1) / 2
#    end
#end
         

def bsearch(arr, l = 0, r = arr.length - 1, target)
    mid = (l + r)/2
    return nil if r < l
    if arr[mid] == target
        return mid

    elsif arr[mid] < target 
        bsearch(arr, mid + 1, r, target)
    
    elsif arr[mid] > target
        bsearch(arr, l,  mid - 1, target )
    end


end


# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


# Merge Sort



# def merge(left, right)
#     new_arr = []

#     while left != [] || right != []
#         if left != [] && right != [] && left[0] < right[0]
#             new_arr << left.delete_at(0)
#         elsif left != [] && right != [] && left[0] > right[0]
#             new_arr << right.delete_at(0)
#         elsif left != [] && right == []
#             new_arr << left.delete_at(0)
#         else
#             new_arr << right.delete_at(0)
#         end
#     end

#     new_arr
# end

def merge(left, right)
    new_arr = []

    while left != [] && right != []
        if left[0] < right[0]
            new_arr << left.delete_at(0)
        else
            new_arr << right.delete_at(0)
        end
    end
    
    if left == []
        new_arr += right
    else
        new_arr += left
    end
    new_arr
end


def merge_sort(arr)
    return arr if arr.length <= 1
    mid_index = (arr.length - 1)/2
    left, right = arr[0..mid_index], arr[mid_index + 1..-1]
    return merge(merge_sort(left), merge_sort(right))
end

#p merge_sort([4, 5])
# p merge_sort([4, 5, 3, 2 ,10, 11, 6])

#Array Subsets

# def subsets(arr)
#     return if arr.empty?
#     res = []
#     i =  [arr.delete_at(0)]
#     res << i 
#     res << subsets(arr)
#     return res
# end



# def subsets(arr)
    
#     i = [arr.delete_at[0]]
#     $res << i
#     temp = subsets(arr)

# end

#def subsets(arr)
#    return [[]] if arr.length == 0
#    (0...arr.length).each do |i|
#        ori = arr[0..i]
#        alt = arr[i+1..-1]
#        subsets(arr) << ori << arr
#        arr.delete_at(0)
#    end
#end


#$res = []

#def subsets(arr, sub =[], i = 0)
#    if i >= arr.length
#        return 
#    end
#    sub = [arr[i]]
#    $res << sub
#    $res += subsets(arr, sub, i + 1)
#    sub.delete_at(0)
#    $res += subsets(arr, sub, i + 1)
#    
#end


def subsets(arr)
    res = []

    def dfs(arr, i, temp)
        if i >= arr.length
            res << temp
            return
        end

        temp << arr[i]

        dfs(arr, i + 1, temp)

        temp.delete_at(0)

        dfs(arr, i + 1, temp)

    end

    dfs(arr, 0, [])
    return res
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]


#Permutations


#permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
                        #     [2, 1, 3], [2, 3, 1],
                        #     [3, 1, 2], [3, 2, 1]]


#coin change

def greedy_make_change(amount, arr)
    return [] if amount == 0
    count = []
    arr.each do |i|
        if amount - i >= 0
            count << i   
            count += greedy_make_change(amount - i, arr)
            break
        end
    end
    count
end 

p greedy_make_change(24, [10,7,1])


def make_better_change(start, amount, dp)

    return dp[start] if start == amount
    return 
    dp[i] = [dp[i], coin_count].min

end

def coin_change(amount, arr)
    dp = {}
    (1..amount).each do |i|
        dp[i] = amount
    end
    
    arr.each do |i|
        dp[i] = 1
    end

    make_better_change(1, amount, dp)

end


