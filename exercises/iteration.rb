include Math
require 'debugger'

def number_picker
  counter = 250
  while true
    break if counter % 7 == 0
    counter += 1
  end
  puts counter
end

def factors(number)
  (2..sqrt(number).ceil).inject([]) do |factors, possible_factor|
    if number % possible_factor == 0
      factors << possible_factor
      factors << number / possible_factor
    end
    factors
  end.uniq
end

def bubble(number_array)
  if number_array == number_array.sort
    return number_array
  end

  number_array.each_with_index do |number,index|
    break if index == number_array.length-1
    if number > number_array[index + 1]
      number_array[index], number_array[index + 1] = number_array[index + 1], number_array[index]
    end
  end

  bubble(number_array)
end

def substrings(string)
  substrings_array = []
   string.length.times do |i|
    string.scan(/\w/).each_with_index do |letter, index|
      substrings_array << string[index..(index + i)] unless index + i > string.length - 1
    end
  end
  substrings_array
end