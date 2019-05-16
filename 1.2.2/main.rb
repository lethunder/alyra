# !/usr/bin/ruby

taille_pourboire = {2000 => 13000, 6000 => 9000, 800 => 2000, 700 => 1500,	1200 =>	3500, 1000 => 2800,	1300 => 5000, 600 => 1500}
nombre_max_octets = 6000

def calculer_meilleur_pourboire(h={}, nombre_max_octets)
	p h.keys.repeated_combination(h.keys.size).to_a.keep_if{|tab| tab.reduce(:+) <= nombre_max_octets}.sort_by { |tab| tab.map{|elt| h[elt]}.reduce(:+) }.last
end

calculer_meilleur_pourboire(taille_pourboire, nombre_max_octets)

