# !/usr/bin/ruby
#
class Calculatrice
  def self.evaluer(expression)
    expression = expression.split
    operands = []
    evaluation = []

    expression.each do |x|
      case x
      when /\d/
        evaluation.push(x.to_f)
      when "-", "/", "*", "+"
        operands = evaluation.pop(2)
        evaluation.push(operands[0].send(x, operands[1]))
      end
    end
    puts evaluation
  end
end

p Calculatrice.evaluer("1 2 + 4 * 3 +")# => 15