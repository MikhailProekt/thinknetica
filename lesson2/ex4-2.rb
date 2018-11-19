alph = "a".."z"
vow = [ "a", "e", "i", "o", "u" ]
hash = {}
alph.each.with_index(1) { |char, index| hash[char] = index if vow.include?(char) }
puts hash
