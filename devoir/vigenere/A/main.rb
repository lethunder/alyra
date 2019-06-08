#!/usr/bin/env ruby
#encoding: utf-8

ALPHABET = ('A'..'Z').to_a

class Caesar
	def self.encode(str, decalage)
		str.length.times do |index|
			if ALPHABET.map(&:downcase).include?(str[index])
				letter = str[index].ord + decalage
				if letter > "z".ord
					str[index] = (letter - 26).chr
				else
					str[index] = letter.chr
				end
			elsif ALPHABET.include?(str[index].upcase)
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
end

class Vigenere
	def self.encode(key, str)
		key = key.upcase.split('')

		encoded_text = str.upcase.split('').collect do |letter|
			if !ALPHABET.include?(letter)
				cipher_letter = letter
			else
				cipher_letter = Caesar.encode(letter, ALPHABET.index { |x| x.downcase == key.first.downcase })
				key << key.shift
			end
			cipher_letter
		end

		return encoded_text.join
	end
end


p Vigenere.encode('LEMONLEMONLE', 'ATTACKATDAWN') #=> "LXFOPVEFRNHR"
