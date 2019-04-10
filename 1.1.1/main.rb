# !/usr/bin/ruby

def ask_user(min, max)
    p "Selectionnez un chiffre entre #{min} et #{max}"
	selected_number = gets
	selected_number = selected_number.chomp.to_i
end

min = 1
max = 100

random_number = (min...max).to_a.sample

loop do 

    selected_number = ask_user(min, max)
    if selected_number == random_number
	    p "BRAVAOOOOOOOOOOOOOOOO!"
	    break 
    end
	
	message = "FAUX. La valeur entree est #{random_number > selected_number ? 'inferieure' : 'superieure' }. "
	
	case (random_number-selected_number).abs
	when 1..5
		message << "Mais vous etes tres proche !"
	when 6..10
		message << "Mais vous n'etes plus loin !"
	else
	    message << "Vous en etes loin !"
	end
	p message
end 
