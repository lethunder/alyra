# !/usr/bin/ruby

def facto(n)
	(1..n).inject(1, :*)
end

p facto(10)