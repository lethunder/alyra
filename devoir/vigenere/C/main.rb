#!/usr/bin/env ruby
#encoding: utf-8

def regroupement(str, limiter)
	@words = str.split(" ").join.split("")
	grouped_words = []
	@starting_index = 0

	limiter.times do
		index_to_remove = []

		(@starting_index..@words.size).step(limiter).each do |index|
			index_to_remove << index
		end
		grouped_words << index_to_remove.map{|index| @words[index]}.join
		@starting_index += 1
	end

  grouped_words.map(&:upcase)
end

p regroupement("Mes vieilles tantes", 3) # [“MVIEAE”,EILSNS”,”SELTT”]