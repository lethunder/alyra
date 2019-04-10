# !/usr/bin/ruby
def is_palindrome(str)
	# Suppression des espaces
	low_reg_str = str.downcase.delete(' ')
	reverse_str = low_reg_str.split('').reverse().join('')
	reverse_str == low_reg_str;
end

p is_palindrome('ESOPE RESTE ICI ET SE REPOSE')