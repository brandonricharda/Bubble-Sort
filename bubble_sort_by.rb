def sort_if_needed (input, difference, index, item, next_item)
    if difference > 0
        input[index], input[index + 1] = next_item, item
    end
end

def bubble_sort_by (input)
    while !check_sort(input)
        input.each_with_index do |item, index|
            next_item = input[index + 1]
            if next_item
                array_to_check = [item, next_item]
                length_difference = yield array_to_check
                sort_if_needed(input, length_difference, index, item, next_item)
            end
        end
    end
    puts input
end

def check_array (input)
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

check_array(["abcdefg", "abcdefghij", "abcdefghijklmno", "a", "adam", "bar"])