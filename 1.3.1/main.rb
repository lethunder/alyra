#!/usr/bin/env ruby
#encoding: utf-8

text_a_chiffrer = "abc"
decalage = 1

def chiffreCesar(str, decalage)
	caracters_array = str.split("")
	decalage.times do
		caracters_array = caracters_array.map{|caracter| caracter.next}
	end
  p caracters_array.join
end

chiffreCesar(text_a_chiffrer, decalage)