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
	def self.decode(str, decalage)
		str.length.times do |index|
			if ALPHABET.map(&:downcase).include?(str[index])
				letter = str[index].ord - decalage
				if letter < "a".ord
					str[index] = ("z".ord - ("a".ord - letter - 1)).chr
				else
					str[index] = letter.chr
				end
			elsif ALPHABET.include?(str[index].upcase)
				letter = str[index].ord - decalage
				if letter < "A".ord
					str[index] = ("Z".ord - ("A".ord - letter - 1)).chr
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
		key = generate_key(key, str)

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

	def self.decode(key, str)
		key = generate_key(key, str)

		decoded_text = str.split('').collect do |cipher_letter|
			if !ALPHABET.include?(cipher_letter)
				letter = cipher_letter
			else
				letter = Caesar.decode(cipher_letter, ALPHABET.index{ |x| x.downcase == key.first.downcase })
				key << key.shift
			end
			letter
		end

		return decoded_text.join
	end
	private
	def self.generate_key(key, str)
		key = key.upcase.split('')
		if key.count > str.length
			key = key[0..(str.length-1)]
		elsif key.count < str.length
			key = (key*(length.count/key.count.to_f).ceil)[0..(length.count-1)]
		end
		key
	end
end


p Vigenere.encode('LEMONLEMONLE', 'ATTACKATDAWN') #=> "LXFOPVEFRNHR"
p Vigenere.decode('LEMONLEMONLE', "LXFOPVEFRNHR") #=> 'ATTACKATDAWN'