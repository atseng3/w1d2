#!/usr/bin/env ruby

def guessing_game
  computer_number = rand(101)
  counter = 0
  while true
    print "Guess a number: "
    user_number = gets.chomp
    counter += 1

    if user_number.to_i == computer_number
      return "You Win!!!"
    elsif user_number.to_i > computer_number
      puts "guess lower, you've guessed #{counter} times"
    else
      puts "guess higher you've guessed #{counter} times"
    end
  end
end

class RPN

  def initialize
    @stack = []
    @operator_hash = { "+" => :add, "-" => :subtract, "*" => :multiply, '/' => :divide }
  end

  def add
    @stack.push(@stack.pop + @stack.pop)
  end

  def subtract
    second_number = @stack.pop
    @stack.push(@stack.pop - second_number)
  end

  def multiply
    @stack.push(@stack.pop * @stack.pop)
  end

  def divide
    second_number = @stack.pop
    @stack.push(@stack.pop / second_number)
  end

  def working_input
    # debugger
    print "Enter input: "
    user_input = gets.chomp.split('')
    user_input.each do |input|
      if input.match(/\d/)
        @stack.push(input.to_i)
      else
        send(@operator_hash[input])
      end
    end
    p @stack.last
    @stack = []
  end
end

def shuffle_file
  print "Please input file name: "
  input_file = gets.chomp
  contents = File.readlines("./#{input_file}")
  shuffled_contents = contents.shuffle
  new_file = File.open("./#{input_file}-shuffled.txt", 'w')
  shuffled_contents.each do |line|
    new_file.puts line
  end
end