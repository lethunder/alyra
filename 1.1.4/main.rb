# !/usr/bin/ruby

class Circle
	attr_reader :rayon

	def initialize(rayon)
		@rayon = rayon
	end

	def aire
		Math::PI * rayon * rayon
	end

	def perimetre
		Math::PI * diametre
	end

	private
	def diametre
		2 * rayon
	end
end

circle = Circle.new(10)
p circle.aire
p circle.perimetre