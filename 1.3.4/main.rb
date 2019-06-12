#!/usr/bin/env ruby
#encoding: utf-8

class CourbeElliptique
  attr_accessor :a, :b
  def initialize(a, b)
    @a = a
    @b = b
    verifier_courbe
  end
  def testPoint(x, y)
    y**2 == x**2 + a*x + b
  end
  def equal(courbe)
    a == courbe.a && b == courbe.b
  end
  def retourner_courbe
    "Courbe: a= #{a} b=#{b}"
  end
  private
    def verifier_courbe
      raise if 4*a**3 + 27*b**2 == 0
    end
end


p curve = CourbeElliptique.new(4, 7)
p curve1 = CourbeElliptique.new(4, 7)
p curve.testPoint(3, 5)
p curve.retourner_courbe
p curve.equal(curve1)