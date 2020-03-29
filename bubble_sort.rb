def check_array(input) #checks to make sure the user has not passed an incompatible argument
    if input.kind_of?(Array) && input.all? { |item| item.kind_of?(Integer) }
        bubble_sort(input)
    else
        puts "Please use an array consisting entirely of numbers as your argument for this method."
    end
end

def bubble_sort(input)
    while !check_sort(input) #block below runs until check_sort returns true, which indicates everything is in order
        input.each_with_index do |item, index|
            next_item = input[index + 1]
            if next_item && item > next_item
                input[index], input[index + 1] = next_item, item
            end
        end
    end
    puts input
end

def check_sort(input)
    result = true
    input.each_with_index do |item, index|
        next_item = input[index + 1]
        if next_item && item > next_item
            result = false
        end
    end
    result
end

check_array([2,3,78,2,0,2])