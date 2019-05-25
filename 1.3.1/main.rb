#!/usr/bin/env ruby
#encoding: utf-8

text_a_chiffrer = "abc"
decalage = 1

def chiffreCesar(str, decalage)
	str.length.times do |index|
		if /[a-z]/.match(str[index])
			letter = str[index].ord + decalage
			if letter > "z".ord
				str[index] = (letter - 26).chr
			else
				str[index] = letter.chr
			end
		elsif /[A-Z]/.match(str[index])
			letter = str[index].ord + decalage
			if letter > "Z".ord
				str[index] = (letter - 26).chr
			else
				str[index] = letter.chr
			end
		end
	end
	str
end

p chiffreCesar(text_a_chiffrer, decalage)