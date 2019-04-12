#!/usr/bin/env ruby
#encoding: utf-8

def frequences(str)
	list_array = []
	str.each_char do |letter|
		list_array << [letter,str.count(letter)]
	end

	list_array.uniq.sort_by!{|elt| -elt.last}.map{|elt| "#{elt.last} #{elt.first}"}.join("    ")
end

p frequences("Etre contesté, c’est être constaté")