alph = "a".."z"
vow = [ "a", "e", "i", "o", "u" ]
hash = {}
alph.each_with_index { |char, index| hash[char] = index+1 if vow.include?(char) }
puts hash
