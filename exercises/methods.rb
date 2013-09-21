require 'debugger'
def rps(user_choice)
  choices = { rock: "scissors", scissors: "paper", paper: "rock" }
  computer_choice = choices.keys[rand(3)]
  if choices[computer_choice] == user_choice
    puts "#{computer_choice}, Lose"
  elsif choices[user_choice.to_sym] == computer_choice.to_s
    puts "#{computer_choice}, Win"
  else
    puts "#{computer_choice}, Draw"
  end
end

def remix(ingredients)
  remixed = []
  alcohols, non_alcohols = unzip(ingredients)[0], unzip(ingredients)[1]
  remixed_alcohols = alcohols.shuffle
  remixed_non_alcohols = non_alcohols.shuffle
  remixed = remixed_alcohols.zip(remixed_non_alcohols)
end

def unzip(ingredients)
  alcohols = []
  non_alcohols = []
  ingredients.each do |alcohol,non_alcohol|
    alcohols << alcohol
    non_alcohols << non_alcohol
  end
  [alcohols, non_alcohols]
end