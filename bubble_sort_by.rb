def bubble_sort_by (input)
    while !check_sort(input) #the block below runs until the function check_sort returns true, indicating everything is in order
        input.each_with_index do |item, index|
            next_item = input[index + 1]
            if next_item #if next_item is falsey, that means we're on the last item in the array
                array_to_check = [item, next_item] #creates a new array of two items in order to compare their length
                length_difference = yield array_to_check
                sort_if_needed(input, length_difference, index, item, next_item) #passes arguments to sort_if_needed, which determines if... you get it.
            end
        end
    end
    puts input
end

def check_array (input) #function checks to make sure user hasn't sent something incompatible as an argument
    if input.kind_of?(Array) && input.all? { |item| item.kind_of?(String) }
        bubble_sort_by(input) { |left, right| left.length - right.length }
    else
        puts "Please enter an array that is comprised only of strings. The program will arrange them by length."
    end
end

def check_sort (input)
    result = true
    input.each_with_index do |item, index|
        next_item = input[index + 1]
        if next_item && item.length > next_item.length
            result = false
        end
    end
    result
end

def sort_if_needed (input, difference, index, item, next_item)
    if difference > 0
        input[index], input[index + 1] = next_item, item
    end
end

check_array(["abcdefg", "abcdefghij", "abcdefghijklmno", "a", "adam", "bar"])