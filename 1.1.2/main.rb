# !/usr/bin/ruby

def ask_user(min, max)
  p "Selectionnez un chiffre entre #{min} et #{max}"
	selected_number = gets
	selected_number = selected_number.chomp.to_i
end

def middle_value_of(min, max)
  dif = max - min
  n = dif/2
  min + n
end

def search
  min = 1
  max = 100

  selected_number = ask_user(min, max)
  estimated_value = 50

  loop do
    if estimated_value < selected_number
      min = estimated_value
      estimated_value = middle_value_of(min, max)
    elsif estimated_value > selected_number
      max = estimated_value
      estimated_value = middle_value_of(min, max)
    else
      print "le chiffre recherché est #{estimated_value}"
      break
    end
  end
end

search