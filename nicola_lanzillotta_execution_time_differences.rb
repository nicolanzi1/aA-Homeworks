def my_min_1a(list)
    min_num = nil

    list.each do |num1|
        dup_list = list.dup
        dup_list.delete(num1)
        min_num = num1 if dup_list.all? { |num2| num2 > num1 }
    end

    min_num
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_1a(list)  # =>  -5

def my_min_1b(list)
    list.each_with_index do |num1, i1|
        min = true
        list.each_with_index do |num2, i2|
            next if i1 == i2
            min = false if num2 < num1
        end
        return num1 if min
    end
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_1b(list)  # =>  -5

def my_min_2(list)
    min_num = list.first

    list.each { |num| min_num = num if num < min_num }

    min_num
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_2(list)  # =>  -5

def largest_contiguous_subsum1(array)
    subs = []
    
    array.each_index do |idx1|
        (idx1..array.length - 1).each do |idx2|
            subs << array[idx1..idx2]
        end
    end

    subs.map { |sub| sub.inject(:+) }.max
end

# list = [5, 3, -7]
# p largest_contiguous_subsum1(list) # => 8

# # possible sub-sums
# [5]           # => 5
# [5, 3]        # => 8 --> we want this one
# [5, 3, -7]    # => 1
# [3]           # => 3
# [3, -7]       # => -4
# [-7]          # => -7

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum1(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p largest_contiguous_subsum1(list) # => -1 (from [-1])

def largest_contiguous_subsum2(arr)
    largest = arr.first
    current = arr.first

    (1...arr.length).each do |i|
        current = 0 if current < 0
        current += arr[i]
        largest = current if current > largest
    end

    largest
end

# list = [5, 3, -7]
# p largest_contiguous_subsum2(list) # => 8

# # possible sub-sums
# [5]           # => 5
# [5, 3]        # => 8 --> we want this one
# [5, 3, -7]    # => 1
# [3]           # => 3
# [3, -7]       # => -4
# [-7]          # => -7

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum2(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p largest_contiguous_subsum2(list) # => -1 (from [-1])