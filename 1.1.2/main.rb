# !/usr/bin/ruby

def ask_user(min, max)
  p "Selectionnez un chiffre entre #{min} et #{max}"
	selected_number = gets
	selected_number = selected_number.chomp.to_i
end

def matches?(selected_number, random_number)
  selected_number == random_number
end

min = 1
max = 100

selected_number = ask_user(min, max)
random_number = max

loop do

  if matches?(selected_number, random_number)
    p "BRAVAOOOOOOOOOOOOOOOO!"
    break
  end

  random_number -= 1
	p "FAUX. La valeur sélectionnée entree est incorrecte"
  break if random_number == 1
end 

